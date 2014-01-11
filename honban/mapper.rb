#!/usr/bin/ruby
#encoding: utf-8

require './getNoum'

class Mapper

  require 'csv'
  require 'nokogiri'
  require 'open-uri'
  require 'open_uri_redirections'
  require 'timeout'

  TIME_OUT = 1

  def initialize

    @noumObj = GetNoum.new()

  end

  def mapperMain

    @countLimit = 0 # debug

    @isFirst = true

    ARGF.each do |line|

      # debug
      if @countLimit > 5000 then
        break
      end
       @countLimit += 1

      @row = line.split(",")[1].delete("\"")

      if !@isFirst then
        # puts @row # debug
        # puts @countLimit # debug

        if !@row.include?("http") then
          next
        end

        begin
          timeout(TIME_OUT){
              @doc = Nokogiri::HTML(open(@row,:allow_redirections=> :safe).read, nil, 'UTF-8')
            }
          rescue TimeoutError => e
            # timeoutの例外処理
          rescue => e
            # timeout以外のo例外処理
        end

        if @doc == nil then
          next
        end
        @doc.css("p").each do |elm|
          @noumObj.getNoum(elm.content)
        end

      else
        @isFirst = false
      end
    end

  end

end

mapObj = Mapper.new
mapObj.mapperMain


