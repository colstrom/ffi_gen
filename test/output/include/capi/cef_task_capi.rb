# Generated by ffi-gen. Please do not change this file by hand.

require 'ffi'

module CEF
  extend FFI::Library
  ffi_lib 'cef'
  
  def self.attach_function(name, *_)
    begin; super; rescue FFI::NotFoundError => e
      (class << self; self; end).class_eval { define_method(name) { |*_| raise e } }
    end
  end
  
  # CEF maintains multiple internal threads that are used for handling different
  # types of tasks in different processes. See the cef_thread_id_t definitions in
  # cef_types.h for more information. This function will return true (1) if
  # called on the specified thread. It is an error to request a thread from the
  # wrong process.
  # 
  # @method currently_on(thread_id)
  # @param [unknown] thread_id 
  # @return [Integer] 
  # @scope class
  attach_function :currently_on, :cef_currently_on, [:char], :int
  
  # (Not documented)
  class Task < FFI::Struct
    layout :dummy, :char
  end
  
  # Post a task for execution on the specified thread. This function may be
  # called on any thread. It is an error to request a thread from the wrong
  # process.
  # 
  # @method post_task(thread_id, task)
  # @param [unknown] thread_id 
  # @param [Task] task 
  # @return [Integer] 
  # @scope class
  attach_function :post_task, :cef_post_task, [:char, Task], :int
  
  # (Not documented)
  class Task < FFI::Struct
    layout :dummy, :char
  end
  
  # Post a task for delayed execution on the specified thread. This function may
  # be called on any thread. It is an error to request a thread from the wrong
  # process.
  # 
  # @method post_delayed_task(thread_id, task, delay_ms)
  # @param [unknown] thread_id 
  # @param [Task] task 
  # @param [Integer] delay_ms 
  # @return [Integer] 
  # @scope class
  attach_function :post_delayed_task, :cef_post_delayed_task, [:char, Task, :long], :int
  
  # Implement this structure for task execution. The functions of this structure
  # may be called on any thread.
  # 
  # = Fields:
  # :base ::
  #   (unknown) Base structure.
  # :execute ::
  #   (FFI::Pointer(*)) Method that will be executed. |threadId| is the thread executing the call.
  class Task < FFI::Struct
    layout :base, :char,
           :execute, :pointer
  end
  
end
