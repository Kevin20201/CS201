; ModuleID = 'rename.bc'
source_filename = "test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test() #0 {
bb:
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i3 = alloca i32, align 4
  %i4 = alloca i32, align 4
  %i5 = alloca i32, align 4
  store i32 0, i32* %i, align 4
  store i32 1, i32* %i2, align 4
  br label %bb6

bb6:                                              ; preds = %bb27, %bb
  %i7 = load i32, i32* %i, align 4
  %i8 = add nsw i32 %i7, 1
  store i32 %i8, i32* %i2, align 4
  %i9 = load i32, i32* %i2, align 4
  %i10 = load i32, i32* %i1, align 4
  %i11 = mul nsw i32 %i9, %i10
  store i32 %i11, i32* %i2, align 4
  %i12 = load i32, i32* %i1, align 4
  %i13 = icmp sgt i32 %i12, 9
  br i1 %i13, label %bb14, label %bb20

bb14:                                             ; preds = %bb6
  %i15 = load i32, i32* %i3, align 4
  %i16 = load i32, i32* %i2, align 4
  %i17 = mul nsw i32 %i15, %i16
  store i32 %i17, i32* %i5, align 4
  %i18 = load i32, i32* %i5, align 4
  %i19 = sub nsw i32 %i18, 3
  store i32 %i19, i32* %i2, align 4
  br label %bb25

bb20:                                             ; preds = %bb6
  %i21 = load i32, i32* %i4, align 4
  %i22 = add nsw i32 %i21, 1
  store i32 %i22, i32* %i, align 4
  %i23 = load i32, i32* %i3, align 4
  %i24 = sdiv i32 %i23, 2
  store i32 %i24, i32* %i4, align 4
  br label %bb25

bb25:                                             ; preds = %bb20, %bb14
  %i26 = load i32, i32* %i1, align 4
  store i32 %i26, i32* %i, align 4
  br label %bb27

bb27:                                             ; preds = %bb25
  %i28 = load i32, i32* %i, align 4
  %i29 = icmp slt i32 %i28, 9
  br i1 %i29, label %bb6, label %bb30, !llvm.loop !2

bb30:                                             ; preds = %bb27
  %i31 = load i32, i32* %i, align 4
  %i32 = add nsw i32 %i31, 1
  store i32 %i32, i32* %i, align 4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %arg, i8** %arg1) #0 {
bb:
  %i = alloca i32, align 4
  %i2 = alloca i32, align 4
  %i3 = alloca i8**, align 8
  store i32 0, i32* %i, align 4
  store i32 %arg, i32* %i2, align 4
  store i8** %arg1, i8*** %i3, align 8
  call void @test()
  ret i32 0
}

attributes #0 = { noinline nounwind optnone uwtable "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 12.0.1 (https://github.com/Kevin20201/CS201.git 7c331b6fd146ab2c5c1367f46e3504ffafdd0768)"}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.mustprogress"}
