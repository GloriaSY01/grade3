import chisel3._
import chisel3.util.{is, _}

import scala.language.postfixOps

class md5 extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(128.W))
    val in_valid = Input(Bool())

    val out = Output(UInt(128.W))
    val out_valid = Output(Bool())
    val ready = Output(Bool())
  })
  io.out := 0.U
  io.out_valid := false.B
  io.ready := false.B
  val idle :: r0 :: r1 :: r2 :: r3 :: finished :: turn_arnd :: Nil = Enum(7)
  val A = RegInit(defs.A)
  val B = RegInit(defs.B)
  val C = RegInit(defs.C)
  val D = RegInit(defs.D)
  val AA = RegInit(0.U(32.W))
  val BB = RegInit(0.U(32.W))
  val CC = RegInit(0.U(32.W))
  val DD = RegInit(0.U(32.W))
  val next_A = Wire(UInt(32.W))
  val next_B = Wire(UInt(32.W))
  val next_C = Wire(UInt(32.W))
  val next_D = Wire(UInt(32.W))
  val phase = RegInit(0.U(4.W))
  val state = RegInit(1.U(8.W))
  val next_state = Wire(UInt(8.W))
  val msg = RegInit(0.U(512.W))
  val r = Module(new md5round)
  val out_r = RegInit(false.B)



  // initial wires
  next_A := A
  next_B := B
  next_C := C
  next_D := D
  next_state := state

  out_r := state(finished)
  io.out_valid := out_r
  io.ready := state(idle) //就绪
  io.out := A ## B ## C ## D //32×4=128位输出

  //initial new wires

  r.io.a := 0.U
  r.io.b := 0.U
  r.io.c := 0.U
  r.io.d := 0.U
  r.io.m := 0.U
  r.io.s := 0.U
  r.io.t := 0.U
  r.io.r := 0.U

  // update regs
  state := next_state

  //下一个状态就绪
  when(next_state(idle)) {
    AA := 0.U
    BB := 0.U
    CC := 0.U
    DD := 0.U
  }.elsewhen(next_state(r0) && state(idle)) {
    AA := A
    BB := B
    CC := C
    DD := D
  }

  // TODO: add code for update A B C D
  when(next_state(idle)) {
    A := defs.A
    B := defs.B
    C := defs.C
    D := defs.D
  }.otherwise {
    A := next_A
    B := next_B
    C := next_C
    D := next_D
  }

  // TODO: add code for update phase

  when(next_state(r0) && state(idle)) {
    phase := 0.U
  }.otherwise {
    phase := 1.U + phase
  }
  // 更新输入信息
    when(next_state(idle)) {
    msg := 0.U
  }.elsewhen(next_state(r0) && state(idle)) {
    msg := Cat(io.in, io.in, io.in, io.in)//将128位输入变为512位
  }

  // combine logic
  // TODO: add code for the starting of the state machine
  when(io.in_valid && state(idle)) {
    printf("begin calculating\n")
    next_state := 2.asUInt //进入下一个状态
  }

  // TODO: add code for 4 rounds calc, you must use md5round module
  when(state(r0)) {
    r.io.r := 0.U
    switch(phase(1, 0)) {
      is(0.U) {
        r.io.a := A
        r.io.b := B
        r.io.c := C
        r.io.d := D
        next_A := r.io.next_a
      }
      is(1.U) {
        r.io.a := D
        r.io.b := A
        r.io.c := B
        r.io.d := C
        next_D := r.io.next_a
      }
      is(2.U) {
        r.io.a := C
        r.io.b := D
        r.io.c := A
        r.io.d := B
        next_C := r.io.next_a
      }
      is(3.U) {
        r.io.a := B
        r.io.b := C
        r.io.c := D
        r.io.d := A
        next_B := r.io.next_a
      }
    }

    for (i <- 0 until 16) //[0.16)
      when(phase === i.U) {
        r.io.m := msg(i * 32 + 31, i * 32)
        r.io.s := defs.S(i)
        r.io.t := defs.K(i)
      }

    when(phase === 15.asUInt) {
      next_state := 4.asUInt
    }
  }

  when(state(r1)) {
    r.io.r := 1.U
    switch(phase(1, 0)) {
      is(0.U) {
        r.io.a := A
        r.io.b := B
        r.io.c := C
        r.io.d := D
        next_A := r.io.next_a
      }
      is(1.U) {
        r.io.a := D
        r.io.b := A
        r.io.c := B
        r.io.d := C
        next_D := r.io.next_a
      }
      is(2.U) {
        r.io.a := C
        r.io.b := D
        r.io.c := A
        r.io.d := B
        next_C := r.io.next_a
      }
      is(3.U) {
        r.io.a := B
        r.io.b := C
        r.io.c := D
        r.io.d := A
        next_B := r.io.next_a
      }
    }

    for (i <- 0 until 16)
      when(phase === i.U) {
        val j = (i >> 1) | ((i << 3) & 0xf)
        r.io.m := msg(j * 32 + 31, j * 32)
        r.io.s := defs.S(16 + i)
        r.io.t := defs.K(16 + i)
      }

    when(phase === 15.asUInt) {
      next_state := 8.asUInt
    }
  }

  when(state(r2)) {
    r.io.r := 2.U
    switch(phase(1, 0)) {
      is(0.U) {
        r.io.a := A
        r.io.b := B
        r.io.c := C
        r.io.d := D
        next_A := r.io.next_a
      }
      is(1.U) {
        r.io.a := D
        r.io.b := A
        r.io.c := B
        r.io.d := C
        next_D := r.io.next_a
      }
      is(2.U) {
        r.io.a := C
        r.io.b := D
        r.io.c := A
        r.io.d := B
        next_C := r.io.next_a
      }
      is(3.U) {
        r.io.a := B
        r.io.b := C
        r.io.c := D
        r.io.d := A
        next_B := r.io.next_a
      }
    }

    for (i <- 0 until 16)
      when(phase === i.U) {
        val j = (i >> 2) | ((i << 2) & 0xf)
        r.io.m := msg(j * 32 + 31, j * 32)
        r.io.s := defs.S(32 + i)
        r.io.t := defs.K(32 + i)
      }

    when(phase === 15.asUInt) {
      next_state := 16.asUInt
    }
  }

  when(state(r3)) {
    r.io.r := 3.U
    switch(phase(1, 0)) {
      is(0.U) {
        r.io.a := A
        r.io.b := B
        r.io.c := C
        r.io.d := D
        next_A := r.io.next_a
      }
      is(1.U) {
        r.io.a := D
        r.io.b := A
        r.io.c := B
        r.io.d := C
        next_D := r.io.next_a
      }
      is(2.U) {
        r.io.a := C
        r.io.b := D
        r.io.c := A
        r.io.d := B
        next_C := r.io.next_a
      }
      is(3.U) {
        r.io.a := B
        r.io.b := C
        r.io.c := D
        r.io.d := A
        next_B := r.io.next_a
      }
    }


    for (i <- 0 until 16)
      when(phase === i.U) {
        val j = (i >> 3) | ((i << 1) & 0xf)
        r.io.m := msg(j * 32 + 31, j * 32)
        r.io.s := defs.S(48 + i)
        r.io.t := defs.K(48 + i)
      }

    when(phase === 15.asUInt) {
      next_state := 32.asUInt
    }
  }

  when(state(finished)) {
    printf("end calculating\n")
    next_A := AA + A
    next_B := BB + B
    next_C := CC + C
    next_D := DD + D
    next_state := 64.asUInt
  }

  when(state(turn_arnd)) {
    next_state := 128.asUInt
  }

}
