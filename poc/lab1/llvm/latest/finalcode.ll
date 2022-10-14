; ModuleID = 'testcode.cpp'
source_filename = "testcode.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%"class.std::ios_base::Init" = type { i8 }
%"class.std::basic_istream" = type { i32 (...)**, i64, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }

@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1
@__dso_handle = external hidden global i8
;常量在使用时直接使用本身，如本题中的N=20，在后续代码中直接使用20
;创建全局变量数组
@matrix = dso_local global [20 x double] zeroinitializer
;创建全局变量max_num作为最大值
@max_num = dso_local global double -1.000000e+08

@_ZSt3cin = external global %"class.std::basic_istream", align 8
@_ZSt4cout = external global %"class.std::basic_ostream", align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_testcode.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1) @_ZStL8__ioinit)
  %1 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #3
  ret void
}

declare void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #1

; Function Attrs: nounwind
declare void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"* noundef nonnull align 1 dereferenceable(1)) unnamed_addr #2

; Function Attrs: nounwind
declare i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #3

define dso_local double @calculate_max(double %0, double %1) #4 {
 
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  store double %0, double* %3, align 8
  store double %1, double* %4, align 8
  %5 = alloca double, align 8
  %6 = load double, double* %3, align 8
  %7 = load double, double* %4, align 8
  %8 = fcmp ogt double %6, %7
  br i1 %8, label %9, label %11

9:                                                
  %10 = load double, double* %3, align 8
  store double %10, double* %5, align 8
  br label %13

11:                                              
  %12 = load double, double* %4, align 8
  store double %12, double* %5, align 8
  br label %13

13:                                               
  %14 = load double, double* %5, align 8
  ret double %14
}

; main function 
;author:wangpeijie

;code of c++
;int main()
;{
;	//zhushi for test
;	int i,flag;
;	i = 0;
;	flag=1;
;	while (i < N && flag==1)
;	{
;		cin >> matrix[i];
;		i++;
;	}
;	int j;
;j = 0;
;	while (j < N)
;	{
;		max_num = calculate_max(max_num, matrix[j]);
;		j++;
;	}
;	cout << max_num << endl;
;	return 0;
;}
define dso_local noundef i32 @main() #5 {
;给四个临时寄存器分配空间
  %1 = alloca i32  ;i
  %2 = alloca i32  ;flag
  %3 = alloca i32  ;j
  %4 = alloca i32  
 ;
  store i32 0, i32* %1, align 4  ;i=0
  store i32 1, i32* %2, align 4  ;flag=1
 ;无条件跳转到进入while循环条件判断的代码块
  br label %5

;label5,8:while循环条件判断的代码块
5:  
  ;先从%1取数i，然后判断条件是小于20                                            
  %6 = load i32, i32* %1, align 4
  %7 = icmp slt i32 %6, 20
  ;有条件分支，%7为真即条件满足，则判断flag的值去label8，不满足条件则直接不进入while循环去label18
  br i1 %7,label %8,label %18

8:      
  ;先从%1取数flag，然后判断条件是等于1                                          
  %9 = load i32,i32* %2,align 4
  %10 = icmp eq i32 %9, 1
  ;有条件分支，%10为真即条件满足，则进入循环去label11，不满足条件则直接不去label18
  br i1 %10,label %11,label %18
  
;while内部循环语句cin >> matrix[i]和i++
11:                                              
  ;先从%1取数i，然后得到输入matrix[i]
  %12 = load i32, i32* %1, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [20 x double], [20 x double]* @matrix, i64 0, i64 %13
  %15 = call noundef nonnull align 8 dereferenceable(16) %"class.std::basic_istream"* @_ZNSirsERd(%"class.std::basic_istream"* noundef nonnull align 8 dereferenceable(16) @_ZSt3cin, double* noundef nonnull align 8 dereferenceable(8) %14)
  ;先从%1取数i，然后完成i++，再存回%1
  %16 = load i32,i32* %1,align 4
  %17 = add nsw i32 %16, 1
  store i32 %17,i32* %1,align 4
  ;需要继续跳转到while条件判断语句块中
  br label %5,!llvm.loop !6
 
18:
;第一个while循环外，完成j的声明和初始化                                              
  store i32 0, i32* %3, align 4  ;j=0
  br label %19
  
19:
;进行第二个while循环的条件判断j < N
  %20 = load i32, i32* %3, align 4
  %21 = icmp slt i32 %20, 20
  ;有条件分支，%21为真即条件满足，则进入循环去label22，不满足条件则直接不进入while循环去label31
  br i1 %21, label %22, label %31

22:
;第二个while内部完成函数的调用max_num = calculate_max(max_num, matrix[j])和J++
  ;先完成max_num = calculate_max(max_num, matrix[j])
  %23 = load double, double* @max_num, align 8
  %24 = load i32, i32* %3, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [20 x double], [20 x double]* @matrix, i64 0, i64 %25
  %27 = load double, double* %26, align 8
  ;函数的调用：第一个参数是取出的max_num，第二个参数是取出的 matrix[j]
  %28 = call noundef double @calculate_max(double noundef %23, double noundef %27)
  ;函数调用完毕后把值存入max_num中
  store double %28, double* @max_num, align 8
  ;再完成j++
  %29 = load i32, i32* %3, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %3, align 4
  ;需要继续跳转到while条件判断语句块中
  br label %19, !llvm.loop !8
  
31:
;第二个while循环之外的内容，即输出max_num和返回0
  %32 = load double, double* @max_num, align 8
  ;输出max_num
  %33 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) @_ZSt4cout, double noundef %32)
  %34 = call noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8) %33, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* noundef @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_)
  ret i32 0
}


declare noundef nonnull align 8 dereferenceable(16) %"class.std::basic_istream"* @_ZNSirsERd(%"class.std::basic_istream"* noundef nonnull align 8 dereferenceable(16), double* noundef nonnull align 8 dereferenceable(8)) #1

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEd(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), double noundef) #1

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8), %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* noundef) #1

declare noundef nonnull align 8 dereferenceable(8) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* noundef nonnull align 8 dereferenceable(8)) #1

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_testcode.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  ret void
}

attributes #0 = { noinline uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }
attributes #4 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
