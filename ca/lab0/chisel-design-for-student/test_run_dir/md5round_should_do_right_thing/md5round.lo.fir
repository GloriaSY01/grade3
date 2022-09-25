circuit md5round :
  module md5round :
    input clock : Clock
    input reset : UInt<1>
    input io_a : UInt<32>
    input io_b : UInt<32>
    input io_c : UInt<32>
    input io_d : UInt<32>
    input io_m : UInt<32>
    input io_s : UInt<5>
    input io_t : UInt<32>
    input io_r : UInt<2>
    output io_next_a : UInt<32>

    node _T_4 = eq(UInt<1>("h0"), io_r) @[md5round.scala 21:16]
    node _add_res_T = and(io_b, io_c) @[md5round.scala 36:8]
    node _add_res_T_1 = not(io_b) @[md5round.scala 36:17]
    node _add_res_T_2 = and(_add_res_T_1, io_d) @[md5round.scala 36:28]
    node _add_res_T_3 = or(_add_res_T, _add_res_T_2) @[md5round.scala 36:13]
    node _add_res_T_4 = add(io_a, _add_res_T_3) @[md5round.scala 23:23]
    node _add_res_T_5 = tail(_add_res_T_4, 1) @[md5round.scala 23:23]
    node _add_res_T_6 = add(_add_res_T_5, io_m) @[md5round.scala 23:45]
    node _add_res_T_7 = tail(_add_res_T_6, 1) @[md5round.scala 23:45]
    node _add_res_T_8 = add(_add_res_T_7, io_t) @[md5round.scala 23:52]
    node _add_res_T_9 = tail(_add_res_T_8, 1) @[md5round.scala 23:52]
    node _T_5 = eq(UInt<1>("h1"), io_r) @[md5round.scala 21:16]
    node _add_res_T_10 = and(io_b, io_d) @[md5round.scala 39:8]
    node _add_res_T_11 = not(io_d) @[md5round.scala 39:21]
    node _add_res_T_12 = and(io_c, _add_res_T_11) @[md5round.scala 39:18]
    node _add_res_T_13 = or(_add_res_T_10, _add_res_T_12) @[md5round.scala 39:13]
    node _add_res_T_14 = add(io_a, _add_res_T_13) @[md5round.scala 26:23]
    node _add_res_T_15 = tail(_add_res_T_14, 1) @[md5round.scala 26:23]
    node _add_res_T_16 = add(_add_res_T_15, io_m) @[md5round.scala 26:45]
    node _add_res_T_17 = tail(_add_res_T_16, 1) @[md5round.scala 26:45]
    node _add_res_T_18 = add(_add_res_T_17, io_t) @[md5round.scala 26:52]
    node _add_res_T_19 = tail(_add_res_T_18, 1) @[md5round.scala 26:52]
    node _T_6 = eq(UInt<2>("h2"), io_r) @[md5round.scala 21:16]
    node _add_res_T_20 = xor(io_b, io_c) @[md5round.scala 42:7]
    node _add_res_T_21 = xor(_add_res_T_20, io_d) @[md5round.scala 42:11]
    node _add_res_T_22 = add(io_a, _add_res_T_21) @[md5round.scala 29:23]
    node _add_res_T_23 = tail(_add_res_T_22, 1) @[md5round.scala 29:23]
    node _add_res_T_24 = add(_add_res_T_23, io_m) @[md5round.scala 29:45]
    node _add_res_T_25 = tail(_add_res_T_24, 1) @[md5round.scala 29:45]
    node _add_res_T_26 = add(_add_res_T_25, io_t) @[md5round.scala 29:52]
    node _add_res_T_27 = tail(_add_res_T_26, 1) @[md5round.scala 29:52]
    node _T_7 = eq(UInt<2>("h3"), io_r) @[md5round.scala 21:16]
    node _add_res_T_28 = not(io_d) @[md5round.scala 45:15]
    node _add_res_T_29 = or(io_b, _add_res_T_28) @[md5round.scala 45:12]
    node _add_res_T_30 = xor(io_c, _add_res_T_29) @[md5round.scala 45:7]
    node _add_res_T_31 = add(io_a, _add_res_T_30) @[md5round.scala 32:23]
    node _add_res_T_32 = tail(_add_res_T_31, 1) @[md5round.scala 32:23]
    node _add_res_T_33 = add(_add_res_T_32, io_m) @[md5round.scala 32:45]
    node _add_res_T_34 = tail(_add_res_T_33, 1) @[md5round.scala 32:45]
    node _add_res_T_35 = add(_add_res_T_34, io_t) @[md5round.scala 32:52]
    node _add_res_T_36 = tail(_add_res_T_35, 1) @[md5round.scala 32:52]
    node _GEN_0 = mux(_T_7, _add_res_T_36, UInt<1>("h0")) @[md5round.scala 18:11 21:16 32:15]
    node _GEN_1 = mux(_T_6, _add_res_T_27, _GEN_0) @[md5round.scala 21:16 29:15]
    node _GEN_2 = mux(_T_5, _add_res_T_19, _GEN_1) @[md5round.scala 21:16 26:15]
    node _GEN_3 = mux(_T_4, _add_res_T_9, _GEN_2) @[md5round.scala 21:16 23:15]
    node add_res = _GEN_3 @[md5round.scala 16:21]
    node _T = dshl(add_res, io_s) @[md5round.scala 19:26]
    node _T_1 = sub(UInt<6>("h20"), io_s) @[md5round.scala 19:52]
    node _T_2 = tail(_T_1, 1) @[md5round.scala 19:52]
    node _T_3 = dshr(add_res, _T_2) @[md5round.scala 19:43]
    node rot_res_0 = bits(_T, 31, 0) @[md5round.scala 17:21 19:11]
    node rot_res_1 = _T_3 @[md5round.scala 17:21 19:11]
    node _io_next_a_T = or(rot_res_0, rot_res_1) @[md5round.scala 20:39]
    node _io_next_a_T_1 = add(io_b, _io_next_a_T) @[md5round.scala 20:21]
    node _io_next_a_T_2 = tail(_io_next_a_T_1, 1) @[md5round.scala 20:21]
    io_next_a <= _io_next_a_T_2 @[md5round.scala 20:13]
