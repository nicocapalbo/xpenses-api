class LedgersController < ApplicationController
  include Secured
  # curl --request GET \
  #   --url http://localhost:3001/ledgers \
  #   --header 'authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6ImR5ODJ0UVZIZ0R5MmF6c0xVTUlkUyJ9.eyJpc3MiOiJodHRwczovL2Rldi1xeXFnMGcweC51cy5hdXRoMC5jb20vIiwic3ViIjoiRnNFZUZMdzdLRnpCZzdkTjNoaHIzWHRRekFsYnJ0Tm5AY2xpZW50cyIsImF1ZCI6Imh0dHBzOi8veHBlbnNlcy54eXoiLCJpYXQiOjE2NDQwODE0NjksImV4cCI6MTY0NDE2Nzg2OSwiYXpwIjoiRnNFZUZMdzdLRnpCZzdkTjNoaHIzWHRRekFsYnJ0Tm4iLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMifQ.ZkBD3HdJRGYf7spbN7PvDcgtZH4D9d-857Lk6y8cJLZyFMFnAcWODJCj8bc7iIA8zS-101U2WWtOZek7PAQG-iauJkRK5TJmebss0W8-pMCdeLCTH4qUrXq6lTc0PymM85AiUeJ3CxaTC_20T0BlYMZgckbwSpkip3lcRuA8qLZlP8MDKha2TxefXqU0R1qEqjL4_Xu5JGvmCNgJjxf_tSSatTWvwt3lazMWAaq02WX2xbu6QmjsizaTxF59ewyqPMexSkj6kk3dhRZdya4byfGh381M9z8gCjgF2ZzNiI9JP2Ri4bCRFL5cQrUvC3EkgjUNLI8Ifsbf5lRhTMr5CA'


  def index
    @ledgers = Ledger.all
    render json: { ledgers: @ledgers, user: current_user }
  end

  def create
    @ledger = Ledger.new(ledger_params)
    return unless @ledger.save!
  end

  private

  def ledger_params
    params.require(:ledger).permit(:name, :description)
  end
end
