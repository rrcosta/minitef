require_relative '../router'

Router.draw do
  get('/') { 'Mini TEF' }

  get 'articles/index'

  get '/agente/clisitef/pinpad/open' do
    {
      serviceStatus: 0,
      clisitefStatus: 'pinpad opened'
    }.to_json
  end

  get '/agente/clisitef/pinpad/close' do
    {
      serviceStatus: 0,
      clisitefStatus: 'pinpad closed'
    }.to_json
  end

  get '/agente/clisitef/state' do
    {
      serviceStatus: 0,
      serviceState: 1,
      serviceVersion: "1.0.0.2.b1"
    }.to_json
  end

  get '/agente/clisitef/session' do
    {
      serviceStatus: 0,
      clisitefStatus: 'number of session',
      sessionId: "45dd5cd"
    }.to_json
  end

  get '/agente/clisitef/startTransaction' do
    {
      serviceStatus: 0,
      clisitefStatus: 10000,
      sessionId: "45dd5cd"
    }.to_json
  end

  get '/agente/clisitef/continueTransaction' do
    {
      serviceStatus: 0,
      sessionId: "45dd5cd",
      clisitefStatus: '',
      data: '',
      commandId: 100,
      fieldId: 0200
    }.to_json
  end

  get '/agente/clisitef/finishTransaction' do
    {
      serviceStatus: 0,
      clisitefStatus: ''
    }.to_json
  end
end