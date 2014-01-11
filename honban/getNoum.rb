#!/usr/bin/ruby
#encoding: utf-8

class GetNoum

  require 'MeCab'

  ENCOD_TYPE = "utf-8"

  def initialize()
  end

  def getNoum(sentence)
    @sentence = sentence
    @mecab = MeCab::Tagger.new
    @node = @mecab.parseToNode(@sentence)

    begin
      @node = @node.next
      if /^名詞/ =~ @node.feature.force_encoding(ENCOD_TYPE)
        begin
          puts "#{@node.surface.force_encoding(ENCOD_TYPE)}\t1"
        rescue Errno::EPIPE
          break
        end
      end
      if @node.next == nil then
        break
      end
    end until @node.next.feature.include?("BOS/EOS")
  end

end
