total, *list = ARGV

@mem = {}
@tmp = []
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

bag = []
ans = []
vending(total.to_i, list.map(&:to_i).sort.reverse, bag, ans)

ans =  ans.map!{|a| a.group_by(&:itself).transform_values(&:count)}
ans.map{|a| p a }

