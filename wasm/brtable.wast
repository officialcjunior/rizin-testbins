;;; TOOL: run-interp
(module
  (func $f (param i32) (result i32)
    block $default
      block $2
        block $1
          block $0
            get_local 0
            br_table $0 $1 $2 $default
          end
          ;; 0
          i32.const 0
          return
        end
        ;; 1
        i32.const 1
        return 
       end
      end
      ;; 2, fallthrough
      
    ;; default
    i32.const 2
    return)

  (func (export "test0") (result i32)
    i32.const 0 
    call $f)
  (func (export "test1") (result i32) 
    i32.const 1
    call $f)
  (func (export "test2") (result i32)
    i32.const 2 
    call $f)
  (func (export "test3") (result i32)
    i32.const 3
    call $f))
(;; STDOUT ;;;
test0() => i32:0
test1() => i32:1
test2() => i32:2
test3() => i32:2
;;; STDOUT ;;)
