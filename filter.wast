(module
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (import "env" "random" (func $random (param i32) (result i32)))
 (table 0 anyfunc)
 (memory $0 113)
 (data (i32.const 16) "\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\08\00\00\00\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\ff\01\00\00\00")
 (data (i32.const 64) "\ff\ff\ff\ff\00\00\00\00\01\00\00\00\fe\ff\ff\ff\00\00\00\00\02\00\00\00\ff\ff\ff\ff\00\00\00\00\01\00\00\00\01\00\00\00")
 (data (i32.const 112) "\fd\ff\ff\ff\00\00\00\00\03\00\00\00\f6\ff\ff\ff\00\00\00\00\n\00\00\00\fd\ff\ff\ff\00\00\00\00\03\00\00\00\01\00\00\00")
 (data (i32.const 160) "\ff\ff\ff\ff\00\00\00\00\01\00\00\00\ff\ff\ff\ff\00\00\00\00\01\00\00\00\ff\ff\ff\ff\00\00\00\00\01\00\00\00\01\00\00\00")
 (data (i32.const 208) "\01\00\00\00\02\00\00\00\01\00\00\00\02\00\00\00\04\00\00\00\02\00\00\00\01\00\00\00\02\00\00\00\01\00\00\00\10\00\00\00")
 (data (i32.const 256) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\00\00\00")
 (export "memory" (memory $0))
 (export "noise_c" (func $noise_c))
 (export "red_c" (func $red_c))
 (export "clamp" (func $clamp))
 (export "applyKernel" (func $applyKernel))
 (export "outline_c" (func $outline_c))
 (export "threshold_c" (func $threshold_c))
 (func $noise_c (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $4
      (i32.mul
       (get_local $3)
       (get_local $2)
      )
     )
    )
   )
   (loop $label$1
    (i32.store8
     (get_local $1)
     (i32.load8_u
      (get_local $0)
     )
    )
    (set_local $1
     (i32.add
      (get_local $1)
      (i32.const 1)
     )
    )
    (set_local $0
     (i32.add
      (get_local $0)
      (i32.const 1)
     )
    )
    (br_if $label$1
     (tee_local $4
      (i32.add
       (get_local $4)
       (i32.const -1)
      )
     )
    )
   )
  )
  (set_local $1
   (i32.const 1000)
  )
  (loop $label$2
   (i32.store8
    (i32.add
     (tee_local $0
      (i32.shl
       (i32.add
        (call $random
         (get_local $2)
        )
        (i32.mul
         (call $random
          (get_local $3)
         )
         (get_local $2)
        )
       )
       (i32.const 2)
      )
     )
     (i32.const 304)
    )
    (i32.const 255)
   )
   (i32.store8
    (i32.add
     (i32.or
      (get_local $0)
      (i32.const 1)
     )
     (i32.const 304)
    )
    (i32.const 0)
   )
   (i32.store8
    (i32.add
     (i32.or
      (get_local $0)
      (i32.const 2)
     )
     (i32.const 304)
    )
    (i32.const 0)
   )
   (i32.store8
    (i32.add
     (i32.or
      (get_local $0)
      (i32.const 3)
     )
     (i32.const 304)
    )
    (i32.const 255)
   )
   (br_if $label$2
    (tee_local $1
     (i32.add
      (get_local $1)
      (i32.const -1)
     )
    )
   )
  )
 )
 (func $red_c (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (tee_local $2
      (i32.mul
       (get_local $3)
       (get_local $2)
      )
     )
    )
   )
   (loop $label$1
    (i32.store8
     (i32.add
      (get_local $1)
      (i32.const 1)
     )
     (tee_local $3
      (i32.load8_u
       (get_local $0)
      )
     )
    )
    (i32.store8
     (get_local $1)
     (get_local $3)
    )
    (i32.store8
     (i32.add
      (get_local $1)
      (i32.const 2)
     )
     (get_local $3)
    )
    (i32.store8
     (i32.add
      (get_local $1)
      (i32.const 3)
     )
     (i32.const 255)
    )
    (set_local $0
     (i32.add
      (get_local $0)
      (i32.const 4)
     )
    )
    (set_local $1
     (i32.add
      (get_local $1)
      (i32.const 4)
     )
    )
    (br_if $label$1
     (tee_local $2
      (i32.add
       (get_local $2)
       (i32.const -1)
      )
     )
    )
   )
  )
 )
 (func $clamp (param $0 i32) (param $1 i32) (result i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (tee_local $0
      (i32.div_s
       (get_local $0)
       (get_local $1)
      )
     )
     (i32.const 0)
    )
   )
   (return
    (i32.and
     (select
      (i32.const -1)
      (get_local $0)
      (i32.gt_s
       (get_local $0)
       (i32.const 255)
      )
     )
     (i32.const 255)
    )
   )
  )
  (i32.const 0)
 )
 (func $applyKernel (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32) (param $5 i32) (param $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (local $14 i32)
  (set_local $11
   (i32.const -1)
  )
  (set_local $9
   (i32.add
    (i32.add
     (get_local $0)
     (i32.add
      (i32.shl
       (i32.mul
        (get_local $4)
        (i32.add
         (get_local $3)
         (i32.const -1)
        )
       )
       (i32.const 2)
      )
      (i32.shl
       (get_local $2)
       (i32.const 2)
      )
     )
    )
    (i32.const -4)
   )
  )
  (set_local $8
   (i32.add
    (get_local $2)
    (i32.const -1)
   )
  )
  (set_local $7
   (i32.shl
    (get_local $4)
    (i32.const 2)
   )
  )
  (set_local $10
   (get_local $6)
  )
  (set_local $14
   (i32.const 0)
  )
  (loop $label$0
   (set_local $12
    (i32.add
     (get_local $11)
     (get_local $3)
    )
   )
   (set_local $0
    (get_local $8)
   )
   (set_local $13
    (i32.const 0)
   )
   (loop $label$1
    (block $label$2
     (br_if $label$2
      (i32.lt_s
       (get_local $0)
       (i32.const 0)
      )
     )
     (br_if $label$2
      (i32.ge_u
       (get_local $12)
       (get_local $5)
      )
     )
     (br_if $label$2
      (i32.lt_s
       (get_local $12)
       (i32.const 0)
      )
     )
     (br_if $label$2
      (i32.ge_u
       (get_local $0)
       (get_local $4)
      )
     )
     (set_local $14
      (i32.add
       (i32.mul
        (i32.load
         (i32.add
          (get_local $10)
          (get_local $13)
         )
        )
        (i32.load8_u
         (i32.add
          (get_local $9)
          (get_local $13)
         )
        )
       )
       (get_local $14)
      )
     )
    )
    (set_local $0
     (i32.add
      (get_local $0)
      (i32.const 1)
     )
    )
    (br_if $label$1
     (i32.ne
      (tee_local $13
       (i32.add
        (get_local $13)
        (i32.const 4)
       )
      )
      (i32.const 12)
     )
    )
   )
   (set_local $9
    (i32.add
     (get_local $9)
     (get_local $7)
    )
   )
   (set_local $10
    (i32.add
     (get_local $10)
     (i32.const 12)
    )
   )
   (br_if $label$0
    (i32.ne
     (tee_local $11
      (i32.add
       (get_local $11)
       (i32.const 1)
      )
     )
     (i32.const 2)
    )
   )
  )
  (set_local $12
   (i32.add
    (i32.mul
     (get_local $4)
     (get_local $3)
    )
    (get_local $2)
   )
  )
  (set_local $0
   (i32.const 0)
  )
  (block $label$3
   (br_if $label$3
    (i32.lt_s
     (tee_local $13
      (i32.div_s
       (get_local $14)
       (i32.load offset=36
        (get_local $6)
       )
      )
     )
     (i32.const 0)
    )
   )
   (set_local $0
    (select
     (i32.const -1)
     (get_local $13)
     (i32.gt_s
      (get_local $13)
      (i32.const 255)
     )
    )
   )
  )
  (i32.store8
   (i32.add
    (get_local $1)
    (tee_local $13
     (i32.shl
      (get_local $12)
      (i32.const 2)
     )
    )
   )
   (get_local $0)
  )
  (i32.store8
   (i32.add
    (get_local $1)
    (i32.or
     (get_local $13)
     (i32.const 1)
    )
   )
   (get_local $0)
  )
  (i32.store8
   (i32.add
    (get_local $1)
    (i32.or
     (get_local $13)
     (i32.const 2)
    )
   )
   (get_local $0)
  )
  (i32.store8
   (i32.add
    (get_local $1)
    (i32.or
     (get_local $13)
     (i32.const 3)
    )
   )
   (i32.const 255)
  )
 )
 (func $outline_c (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $4
    (i32.const 0)
   )
   (set_local $5
    (i32.lt_s
     (get_local $2)
     (i32.const 1)
    )
   )
   (loop $label$1
    (block $label$2
     (br_if $label$2
      (get_local $5)
     )
     (set_local $6
      (i32.const 0)
     )
     (loop $label$3
      (call $applyKernel
       (get_local $0)
       (get_local $1)
       (get_local $6)
       (get_local $4)
       (get_local $2)
       (get_local $3)
       (i32.const 16)
      )
      (br_if $label$3
       (i32.ne
        (get_local $2)
        (tee_local $6
         (i32.add
          (get_local $6)
          (i32.const 1)
         )
        )
       )
      )
     )
    )
    (br_if $label$1
     (i32.ne
      (tee_local $4
       (i32.add
        (get_local $4)
        (i32.const 1)
       )
      )
      (get_local $3)
     )
    )
   )
  )
 )
 (func $threshold_c (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32) (param $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i32.shl
     (get_local $2)
     (i32.const 2)
    )
   )
   (set_local $6
    (i32.add
     (get_local $1)
     (i32.const 3)
    )
   )
   (set_local $8
    (i32.lt_s
     (get_local $2)
     (i32.const 1)
    )
   )
   (set_local $7
    (i32.const 0)
   )
   (loop $label$1
    (set_local $10
     (get_local $0)
    )
    (set_local $1
     (get_local $6)
    )
    (set_local $11
     (get_local $2)
    )
    (block $label$2
     (br_if $label$2
      (get_local $8)
     )
     (loop $label$3
      (set_local $9
       (i32.load8_u
        (get_local $10)
       )
      )
      (i32.store8
       (get_local $1)
       (i32.const 255)
      )
      (i32.store8
       (i32.add
        (get_local $1)
        (i32.const -2)
       )
       (tee_local $9
        (select
         (i32.const -1)
         (i32.const 0)
         (i32.gt_u
          (get_local $9)
          (get_local $4)
         )
        )
       )
      )
      (i32.store8
       (i32.add
        (get_local $1)
        (i32.const -3)
       )
       (get_local $9)
      )
      (i32.store8
       (i32.add
        (get_local $1)
        (i32.const -1)
       )
       (get_local $9)
      )
      (set_local $10
       (i32.add
        (get_local $10)
        (i32.const 4)
       )
      )
      (set_local $1
       (i32.add
        (get_local $1)
        (i32.const 4)
       )
      )
      (br_if $label$3
       (tee_local $11
        (i32.add
         (get_local $11)
         (i32.const -1)
        )
       )
      )
     )
    )
    (set_local $0
     (i32.add
      (get_local $0)
      (get_local $5)
     )
    )
    (set_local $6
     (i32.add
      (get_local $6)
      (get_local $5)
     )
    )
    (br_if $label$1
     (i32.ne
      (tee_local $7
       (i32.add
        (get_local $7)
        (i32.const 1)
       )
      )
      (get_local $3)
     )
    )
   )
  )
 )
)
