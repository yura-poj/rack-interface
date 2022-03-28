class App
  def call(_env, time)
    @time = time
    [status, headers, body]
  end

  private

  def status
    200
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    [@time]
  end
end
