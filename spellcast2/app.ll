; ModuleID = 'spellcast2'
source_filename = "spellcast2"

define void @app() {
entry:
  %"#cnt" = alloca i32, align 4
  store i32 0, ptr %"#cnt", align 4
  %"#c2" = alloca i32, align 4
  store i32 0, ptr %"#c2", align 4
  %"#c1" = alloca i32, align 4
  store i32 0, ptr %"#c1", align 4
  %"#r2" = alloca i32, align 4
  store i32 0, ptr %"#r2", align 4
  %"#r1" = alloca i32, align 4
  store i32 0, ptr %"#r1", align 4
  %"#state" = alloca i32, align 4
  store i32 0, ptr %"#state", align 4
  %"#next_step" = alloca i32, align 4
  store i32 0, ptr %"#next_step", align 4
  %"#color" = alloca i32, align 4
  store i32 0, ptr %"#color", align 4
  %"#cell" = alloca i32, align 4
  store i32 0, ptr %"#cell", align 4
  %"#step" = alloca i32, align 4
  store i32 0, ptr %"#step", align 4
  %"#col" = alloca i32, align 4
  store i32 0, ptr %"#col", align 4
  %"#row" = alloca i32, align 4
  store i32 0, ptr %"#row", align 4
  %magic_store = alloca [2 x [64 x [64 x i32]]], align 4
  store [2 x [64 x [64 x i32]]] zeroinitializer, ptr %magic_store, align 4
  store i32 0, ptr %"#row", align 4
  br label %whirl.outer.cond

whirl.outer.cond:                                 ; preds = %whirl.outer.inc, %entry
  %0 = load i32, ptr %"#row", align 4
  %1 = icmp slt i32 %0, 64
  br i1 %1, label %whirl.outer.body, label %whirl.after

whirl.outer.body:                                 ; preds = %whirl.outer.cond
  store i32 0, ptr %"#col", align 4
  br label %whirl.inner.cond

whirl.outer.inc:                                  ; preds = %whirl.inner.end
  %2 = load i32, ptr %"#row", align 4
  %3 = add i32 %2, 1
  store i32 %3, ptr %"#row", align 4
  br label %whirl.outer.cond

whirl.after:                                      ; preds = %whirl.outer.cond
  %4 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 28, i64 29
  store i32 2, ptr %4, align 4
  %5 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 28, i64 30
  store i32 2, ptr %5, align 4
  %6 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 28, i64 33
  store i32 2, ptr %6, align 4
  %7 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 28, i64 34
  store i32 2, ptr %7, align 4
  %8 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 29, i64 28
  store i32 2, ptr %8, align 4
  %9 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 29, i64 29
  store i32 2, ptr %9, align 4
  %10 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 29, i64 33
  store i32 2, ptr %10, align 4
  %11 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 29, i64 34
  store i32 2, ptr %11, align 4
  %12 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 30, i64 28
  store i32 2, ptr %12, align 4
  %13 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 30, i64 33
  store i32 2, ptr %13, align 4
  %14 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 30, i64 34
  store i32 2, ptr %14, align 4
  %15 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 30, i64 35
  store i32 2, ptr %15, align 4
  %16 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 31, i64 33
  store i32 2, ptr %16, align 4
  %17 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 31, i64 34
  store i32 2, ptr %17, align 4
  %18 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 31, i64 35
  store i32 2, ptr %18, align 4
  %19 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 33, i64 28
  store i32 2, ptr %19, align 4
  %20 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 33, i64 29
  store i32 2, ptr %20, align 4
  %21 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 33, i64 30
  store i32 2, ptr %21, align 4
  %22 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 33, i64 31
  store i32 2, ptr %22, align 4
  %23 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 34, i64 28
  store i32 2, ptr %23, align 4
  %24 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 34, i64 29
  store i32 2, ptr %24, align 4
  %25 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 34, i64 30
  store i32 2, ptr %25, align 4
  %26 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 34, i64 31
  store i32 2, ptr %26, align 4
  %27 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 35, i64 30
  store i32 2, ptr %27, align 4
  %28 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 35, i64 31
  store i32 2, ptr %28, align 4
  %29 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 35, i64 35
  store i32 2, ptr %29, align 4
  store i32 0, ptr %"#step", align 4
  br label %portal.loop

whirl.inner.cond:                                 ; preds = %whirl.inner.inc, %whirl.outer.body
  %30 = load i32, ptr %"#col", align 4
  %31 = icmp slt i32 %30, 64
  br i1 %31, label %whirl.inner.body, label %whirl.inner.end

whirl.inner.body:                                 ; preds = %whirl.inner.cond
  %32 = load i32, ptr %"#row", align 4
  %33 = load i32, ptr %"#col", align 4
  %34 = zext i32 %32 to i64
  %35 = zext i32 %33 to i64
  %36 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 0, i64 %34, i64 %35
  store i32 0, ptr %36, align 4
  br label %whirl.inner.inc

whirl.inner.inc:                                  ; preds = %whirl.inner.body
  %37 = load i32, ptr %"#col", align 4
  %38 = add i32 %37, 1
  store i32 %38, ptr %"#col", align 4
  br label %whirl.inner.cond

whirl.inner.end:                                  ; preds = %whirl.inner.cond
  br label %whirl.outer.inc

portal.loop:                                      ; preds = %whirl.after12, %whirl.after
  store i32 0, ptr %"#row", align 4
  br label %whirl.outer.cond1

portal.after:                                     ; No predecessors!
  ret void

whirl.outer.cond1:                                ; preds = %whirl.outer.inc3, %portal.loop
  %39 = load i32, ptr %"#row", align 4
  %40 = icmp slt i32 %39, 64
  br i1 %40, label %whirl.outer.body2, label %whirl.after4

whirl.outer.body2:                                ; preds = %whirl.outer.cond1
  store i32 0, ptr %"#col", align 4
  br label %whirl.inner.cond5

whirl.outer.inc3:                                 ; preds = %whirl.inner.end8
  %41 = load i32, ptr %"#row", align 4
  %42 = add i32 %41, 1
  store i32 %42, ptr %"#row", align 4
  br label %whirl.outer.cond1

whirl.after4:                                     ; preds = %whirl.outer.cond1
  call void @simFlush()
  %43 = load i32, ptr %"#step", align 4
  %44 = add i32 %43, 1
  %45 = and i32 %44, 1
  store i32 %45, ptr %"#next_step", align 4
  store i32 0, ptr %"#row", align 4
  br label %whirl.outer.cond9

whirl.inner.cond5:                                ; preds = %whirl.inner.inc7, %whirl.outer.body2
  %46 = load i32, ptr %"#col", align 4
  %47 = icmp slt i32 %46, 64
  br i1 %47, label %whirl.inner.body6, label %whirl.inner.end8

whirl.inner.body6:                                ; preds = %whirl.inner.cond5
  %48 = load i32, ptr %"#step", align 4
  %49 = load i32, ptr %"#row", align 4
  %50 = load i32, ptr %"#col", align 4
  %51 = zext i32 %48 to i64
  %52 = zext i32 %49 to i64
  %53 = zext i32 %50 to i64
  %54 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %51, i64 %52, i64 %53
  %55 = load i32, ptr %54, align 4
  store i32 %55, ptr %"#cell", align 4
  %56 = load i32, ptr %"#cell", align 4
  %57 = icmp eq i32 %56, 1
  %58 = zext i1 %57 to i32
  %59 = icmp ne i32 %58, 0
  %60 = select i1 %59, i32 -13041685, i32 0
  store i32 %60, ptr %"#color", align 4
  %61 = load i32, ptr %"#cell", align 4
  %62 = icmp eq i32 %61, 2
  %63 = zext i1 %62 to i32
  %64 = load i32, ptr %"#color", align 4
  %65 = icmp ne i32 %63, 0
  %66 = select i1 %65, i32 16777215, i32 %64
  store i32 %66, ptr %"#color", align 4
  %67 = load i32, ptr %"#row", align 4
  %68 = load i32, ptr %"#col", align 4
  %69 = load i32, ptr %"#color", align 4
  call void @draw_cell(i32 %67, i32 %68, i32 %69)
  br label %whirl.inner.inc7

whirl.inner.inc7:                                 ; preds = %whirl.inner.body6
  %70 = load i32, ptr %"#col", align 4
  %71 = add i32 %70, 1
  store i32 %71, ptr %"#col", align 4
  br label %whirl.inner.cond5

whirl.inner.end8:                                 ; preds = %whirl.inner.cond5
  br label %whirl.outer.inc3

whirl.outer.cond9:                                ; preds = %whirl.outer.inc11, %whirl.after4
  %72 = load i32, ptr %"#row", align 4
  %73 = icmp slt i32 %72, 64
  br i1 %73, label %whirl.outer.body10, label %whirl.after12

whirl.outer.body10:                               ; preds = %whirl.outer.cond9
  store i32 0, ptr %"#col", align 4
  br label %whirl.inner.cond13

whirl.outer.inc11:                                ; preds = %whirl.inner.end16
  %74 = load i32, ptr %"#row", align 4
  %75 = add i32 %74, 1
  store i32 %75, ptr %"#row", align 4
  br label %whirl.outer.cond9

whirl.after12:                                    ; preds = %whirl.outer.cond9
  %76 = load i32, ptr %"#next_step", align 4
  store i32 %76, ptr %"#step", align 4
  br label %portal.loop

whirl.inner.cond13:                               ; preds = %whirl.inner.inc15, %whirl.outer.body10
  %77 = load i32, ptr %"#col", align 4
  %78 = icmp slt i32 %77, 64
  br i1 %78, label %whirl.inner.body14, label %whirl.inner.end16

whirl.inner.body14:                               ; preds = %whirl.inner.cond13
  %79 = load i32, ptr %"#step", align 4
  %80 = load i32, ptr %"#row", align 4
  %81 = load i32, ptr %"#col", align 4
  %82 = zext i32 %79 to i64
  %83 = zext i32 %80 to i64
  %84 = zext i32 %81 to i64
  %85 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %82, i64 %83, i64 %84
  %86 = load i32, ptr %85, align 4
  store i32 %86, ptr %"#cell", align 4
  %87 = load i32, ptr %"#cell", align 4
  %88 = icmp eq i32 %87, 2
  %89 = zext i1 %88 to i32
  %90 = icmp ne i32 %89, 0
  %91 = select i1 %90, i32 1, i32 3
  store i32 %91, ptr %"#state", align 4
  %92 = load i32, ptr %"#cell", align 4
  %93 = icmp eq i32 %92, 1
  %94 = zext i1 %93 to i32
  %95 = load i32, ptr %"#state", align 4
  %96 = icmp ne i32 %94, 0
  %97 = select i1 %96, i32 0, i32 %95
  store i32 %97, ptr %"#state", align 4
  %98 = load i32, ptr %"#state", align 4
  %99 = icmp eq i32 %98, 3
  %100 = zext i1 %99 to i32
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %wonder.then, label %wonder.cont

whirl.inner.inc15:                                ; preds = %wonder.cont
  %102 = load i32, ptr %"#col", align 4
  %103 = add i32 %102, 1
  store i32 %103, ptr %"#col", align 4
  br label %whirl.inner.cond13

whirl.inner.end16:                                ; preds = %whirl.inner.cond13
  br label %whirl.outer.inc11

wonder.then:                                      ; preds = %whirl.inner.body14
  %104 = load i32, ptr %"#row", align 4
  %105 = add i32 %104, 1
  %106 = and i32 %105, 63
  store i32 %106, ptr %"#r1", align 4
  %107 = load i32, ptr %"#row", align 4
  %108 = add i32 %107, 63
  %109 = and i32 %108, 63
  store i32 %109, ptr %"#r2", align 4
  %110 = load i32, ptr %"#col", align 4
  %111 = add i32 %110, 1
  %112 = and i32 %111, 63
  store i32 %112, ptr %"#c1", align 4
  %113 = load i32, ptr %"#col", align 4
  %114 = add i32 %113, 63
  %115 = and i32 %114, 63
  store i32 %115, ptr %"#c2", align 4
  store i32 0, ptr %"#cnt", align 4
  %116 = load i32, ptr %"#cnt", align 4
  %117 = load i32, ptr %"#step", align 4
  %118 = load i32, ptr %"#r1", align 4
  %119 = load i32, ptr %"#col", align 4
  %120 = zext i32 %117 to i64
  %121 = zext i32 %118 to i64
  %122 = zext i32 %119 to i64
  %123 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %120, i64 %121, i64 %122
  %124 = load i32, ptr %123, align 4
  %125 = icmp eq i32 %124, 2
  %126 = zext i1 %125 to i32
  %127 = add i32 %116, %126
  store i32 %127, ptr %"#cnt", align 4
  %128 = load i32, ptr %"#cnt", align 4
  %129 = load i32, ptr %"#step", align 4
  %130 = load i32, ptr %"#row", align 4
  %131 = load i32, ptr %"#c1", align 4
  %132 = zext i32 %129 to i64
  %133 = zext i32 %130 to i64
  %134 = zext i32 %131 to i64
  %135 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %132, i64 %133, i64 %134
  %136 = load i32, ptr %135, align 4
  %137 = icmp eq i32 %136, 2
  %138 = zext i1 %137 to i32
  %139 = add i32 %128, %138
  store i32 %139, ptr %"#cnt", align 4
  %140 = load i32, ptr %"#cnt", align 4
  %141 = load i32, ptr %"#step", align 4
  %142 = load i32, ptr %"#r2", align 4
  %143 = load i32, ptr %"#col", align 4
  %144 = zext i32 %141 to i64
  %145 = zext i32 %142 to i64
  %146 = zext i32 %143 to i64
  %147 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %144, i64 %145, i64 %146
  %148 = load i32, ptr %147, align 4
  %149 = icmp eq i32 %148, 2
  %150 = zext i1 %149 to i32
  %151 = add i32 %140, %150
  store i32 %151, ptr %"#cnt", align 4
  %152 = load i32, ptr %"#cnt", align 4
  %153 = load i32, ptr %"#step", align 4
  %154 = load i32, ptr %"#row", align 4
  %155 = load i32, ptr %"#c2", align 4
  %156 = zext i32 %153 to i64
  %157 = zext i32 %154 to i64
  %158 = zext i32 %155 to i64
  %159 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %156, i64 %157, i64 %158
  %160 = load i32, ptr %159, align 4
  %161 = icmp eq i32 %160, 2
  %162 = zext i1 %161 to i32
  %163 = add i32 %152, %162
  store i32 %163, ptr %"#cnt", align 4
  %164 = load i32, ptr %"#cnt", align 4
  %165 = load i32, ptr %"#step", align 4
  %166 = load i32, ptr %"#r1", align 4
  %167 = load i32, ptr %"#c1", align 4
  %168 = zext i32 %165 to i64
  %169 = zext i32 %166 to i64
  %170 = zext i32 %167 to i64
  %171 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %168, i64 %169, i64 %170
  %172 = load i32, ptr %171, align 4
  %173 = icmp eq i32 %172, 2
  %174 = zext i1 %173 to i32
  %175 = add i32 %164, %174
  store i32 %175, ptr %"#cnt", align 4
  %176 = load i32, ptr %"#cnt", align 4
  %177 = load i32, ptr %"#step", align 4
  %178 = load i32, ptr %"#r1", align 4
  %179 = load i32, ptr %"#c2", align 4
  %180 = zext i32 %177 to i64
  %181 = zext i32 %178 to i64
  %182 = zext i32 %179 to i64
  %183 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %180, i64 %181, i64 %182
  %184 = load i32, ptr %183, align 4
  %185 = icmp eq i32 %184, 2
  %186 = zext i1 %185 to i32
  %187 = add i32 %176, %186
  store i32 %187, ptr %"#cnt", align 4
  %188 = load i32, ptr %"#cnt", align 4
  %189 = load i32, ptr %"#step", align 4
  %190 = load i32, ptr %"#r2", align 4
  %191 = load i32, ptr %"#c1", align 4
  %192 = zext i32 %189 to i64
  %193 = zext i32 %190 to i64
  %194 = zext i32 %191 to i64
  %195 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %192, i64 %193, i64 %194
  %196 = load i32, ptr %195, align 4
  %197 = icmp eq i32 %196, 2
  %198 = zext i1 %197 to i32
  %199 = add i32 %188, %198
  store i32 %199, ptr %"#cnt", align 4
  %200 = load i32, ptr %"#cnt", align 4
  %201 = load i32, ptr %"#step", align 4
  %202 = load i32, ptr %"#r2", align 4
  %203 = load i32, ptr %"#c2", align 4
  %204 = zext i32 %201 to i64
  %205 = zext i32 %202 to i64
  %206 = zext i32 %203 to i64
  %207 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %204, i64 %205, i64 %206
  %208 = load i32, ptr %207, align 4
  %209 = icmp eq i32 %208, 2
  %210 = zext i1 %209 to i32
  %211 = add i32 %200, %210
  store i32 %211, ptr %"#cnt", align 4
  %212 = load i32, ptr %"#cnt", align 4
  %213 = icmp eq i32 %212, 2
  %214 = zext i1 %213 to i32
  %215 = icmp ne i32 %214, 0
  %216 = select i1 %215, i32 2, i32 0
  store i32 %216, ptr %"#state", align 4
  br label %wonder.cont

wonder.cont:                                      ; preds = %wonder.then, %whirl.inner.body14
  %217 = load i32, ptr %"#next_step", align 4
  %218 = load i32, ptr %"#row", align 4
  %219 = load i32, ptr %"#col", align 4
  %220 = load i32, ptr %"#state", align 4
  %221 = zext i32 %217 to i64
  %222 = zext i32 %218 to i64
  %223 = zext i32 %219 to i64
  %224 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %magic_store, i64 0, i64 %221, i64 %222, i64 %223
  store i32 %220, ptr %224, align 4
  br label %whirl.inner.inc15
}

declare void @draw_cell(i32, i32, i32)

declare void @simFlush()
