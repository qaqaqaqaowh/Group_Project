class PaymentController < ApplicationController
 def new
 	
 	@tournament=Tournament.find(params[:tournament_id])
	@team=Team.find(params[:team_id])
	@total_amount=params[:total]
  	 @client_token = Braintree::ClientToken.generate

	end

  def checkout

  	amount=params[:checkout_form][:amount]
  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  result = Braintree::Transaction.sale(
   :amount => amount,
   :payment_method_nonce => nonce_from_the_client,
   :options => {:submit_for_settlement => true}
   )

  if result.success?
  	puts 'success'
  	@tournament_team=TournamentTeamApprov.find_by_team_id_and_tournament_id(params[:checkout_form][:team_id],params[:checkout_form][:tournament_id])
  	# byebug
  	@tournament_team.update(payment_status:true)
  	# byebug

    redirect_to tournaments_path, :flash => { :success => "Transaction successful!" }
  else
  	puts 'failed'
    redirect_to tournaments_path, :flash => { :error => "Transaction failed. Please try again." }
  end 
end

end
