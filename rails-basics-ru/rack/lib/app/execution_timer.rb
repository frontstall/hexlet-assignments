# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = clock_time
    status, headers, body = @app.call(env)
    request_time = clock_time - start_time

    body << "\nRequest took #{request_time * 1_000_000} ms"
    [status, headers, body]
  end

  def clock_time
    if defined?(Process::CLOCK_MONOTONIC)
      Process.clock_gettime(Process::CLOCK_MONOTONIC)
    else
      Time.now.to_f
    end
  end
end
