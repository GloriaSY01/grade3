import chisel3._
import chisel3.util._

class md5round extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(32.W))
    val b = Input(UInt(32.W))
    val c = Input(UInt(32.W))
    val d = Input(UInt(32.W))
    val m = Input(UInt(32.W))
    val s = Input(UInt(5.W))
    val t = Input(UInt(32.W))
    val r = Input(UInt(2.W))
    val next_a = Output(UInt(32.W))
  })

  //  定义功能函数
  def F(x: UInt, y: UInt, z: UInt): UInt = {
    (x & y) | ((~x).asUInt & z)
  }

  def G(x: UInt, y: UInt, z: UInt): UInt = {
    (x & z) | (y & (~z).asUInt)
  }

  def H(x: UInt, y: UInt, z: UInt): UInt = {
    x ^ y ^ z
  }

  def I(x: UInt, y: UInt, z: UInt): UInt = {
    y ^ (x | (~z).asUInt)
  }

  // TODO: add code for calculating single round
  val result = Wire(UInt(32.W)) //声明32位
  result := 0.U //记录FF，GG，HH，II计算的结果

  // 根据r的值 选择 进行一次运算（4|16|64）
  switch(io.r) {
    is(0.U) {
      result := io.a + F(io.b, io.c, io.d) + io.m + io.t
    }
    is(1.U) {
      result := io.a + G(io.b, io.c, io.d) + io.m + io.t
    }
    is(2.U) {
      result := io.a + H(io.b, io.c, io.d) + io.m + io.t
    }
    is(3.U) {
      result := io.a + I(io.b, io.c, io.d) + io.m + io.t
    }
  }

  // 输出值，对应b+（左移|右移）
  val left_move = Wire(UInt(32.W))
  val right_move = Wire(UInt(32.W))
  left_move := (result << io.s).asUInt
  right_move := (result >> (32.U - io.s)).asUInt
  io.next_a := io.b + (left_move | right_move)
}
