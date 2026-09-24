; ModuleID = 'struct_point_inline.c'
source_filename = "struct_point_inline.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Point = type { i32, i32 }

@__const.main.p = private unnamed_addr constant %struct.Point { i32 2, i32 3 }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: alwaysinline nounwind uwtable
define dso_local i32 @sum(i64 %0) #0 {
  %2 = alloca %struct.Point, align 4
  store i64 %0, ptr %2, align 4
  %3 = getelementptr inbounds nuw %struct.Point, ptr %2, i32 0, i32 0
  %4 = load i32, ptr %3, align 4
  %5 = getelementptr inbounds nuw %struct.Point, ptr %2, i32 0, i32 1
  %6 = load i32, ptr %5, align 4
  %7 = add nsw i32 %4, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #1 {
  %1 = alloca %struct.Point, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.Point, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %3, ptr align 4 @__const.main.p, i64 8, i1 false)
  %5 = load i64, ptr %3, align 4
  store i64 %5, ptr %1, align 4
  %6 = load i32, ptr %1, align 4
  %7 = getelementptr inbounds nuw %struct.Point, ptr %1, i32 0, i32 1
  %8 = load i32, ptr %7, align 4
  %9 = add nsw i32 %6, %8
  store i32 %9, ptr %4, align 4
  %10 = load i32, ptr %4, align 4
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %10)
  ret i32 0
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

declare i32 @printf(ptr noundef, ...) #3

attributes #0 = { alwaysinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 21.1.8 (6ubuntu1)"}
