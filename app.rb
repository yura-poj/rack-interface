class App
  def call(env)
  @env = env
  [status, headers, body]
  end

  private

  def status
    200
  end

  def headers
    { 'Content-Type' => 'text/plain'}
  end

  def body
    [ " start ----- #{@env}" ]
  end

end
