class VendingMachineController < ApplicationController
  def index
  end

  def what_can_i_buy
    total = params[:money_left].to_i
    list = params[:price_tags].split(',').map(&:to_i)
    bag = []
    ans = []
    vending(total.to_i, list.map(&:to_i).sort.reverse, bag, ans)

    ans =  ans.map!{|a| a.group_by(&:itself).transform_values(&:count)}
    #ans.map{|a| p a }

    respond_to do |format|
      format.json { render json: ans, status: :ok}
    end
  end

  private

  def vending(total, list, bag, ans)
    if total  == 0
      ans << bag
      return
    end
  
    list.each do |i|
      if total >= i
        clone_bag = bag.clone
        clone_bag << i
        vending(total - i, list.select{ |l| l <= i }, clone_bag, ans)
      end
    end
  end
end
