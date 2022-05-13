n, m = gets.to_s.chomp.split(' ').map(&:to_i)
# A = gets.chomp.split(' ').map(&:to_i)
BIG = 10 ** 9
routes = Array.new(n ** 2, BIG)
m.times do |i|
  a, b, c = gets.to_s.chomp.split(' ').map(&:to_i)
  routes[(a - 1) * n + b - 1] = c
end
n.times do |i|
  routes[i * n + i] = 0
end
#dp routes

total = 0
(1..n).each do |k|
  kk = (k - 1) * n
  (1..n).each do |s|
    ss = (s - 1) * n
    (1..n).each do |t|
      tt = (t - 1) * n
      result = [routes[ss + t - 1], routes[ss + k - 1] + routes[kk + t - 1]].min

      if result < BIG
        routes[ss + t - 1] = result
        total += result
      end
      #dp [s, t, k]
      #dp result
    end
  end
end

puts total
