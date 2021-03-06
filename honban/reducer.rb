#!/usr/bin/ruby
#encoding: utf-8

class Reducer

  def reducerMain
    @count = Hash.new{ |h,k| h[k] = 0}
    ARGF.each do |line|
      line.chomp!
      begin
        key, value = line.split(/\t/)
      rescue ArgumentError
        break
      end
      @count[key] += value.to_i
    end
  end

  def printKeyVal
    @count.sort{ |a,b| b[1] <=> a[1]}.each do |k,v|
      puts "#{k}\t#{v}"
    end
  end

end

redObj = Reducer.new
redObj.reducerMain
redObj.printKeyVal
