require './classes/time_format'

class CheckParams
  def initialize(app)
    @app = app
  end

  def call(env)
    @formatter = TimeFormat.new(env['QUERY_STRING'])
    return [status, headers, body] unless @formatter.valid?

    status, headers, body = @app.call(env, @formatter.output)

    [status, headers, body]
  end

  private

  def status
    400
  end

  def headers
    { 'Content-Type' => 'text/plain' }
  end

  def body
    [@formatter.output.to_s]
  end
end
