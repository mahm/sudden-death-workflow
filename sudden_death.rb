# coding: utf-8
class String
  class SuddenDeath
    def initialize(str)
      @str = str.dup.force_encoding('utf-8')
    end

    def to_s
      [header, body, footer].join("\n")
    end

    private

    def wrapper_length
      @str.chars.map{|c| c.bytes.size > 1 ? 2 : 1}.inject(&:+) / 2 + 2
    end

    def header
      ['＿', '人' * wrapper_length, '＿'].join
    end

    def footer
      ['￣', 'Ｙ' * wrapper_length, '￣'].join
    end

    def body
      ['＞　', @str, '　＜'].join
    end
  end

  def to_sudden_death
    SuddenDeath.new(self).to_s
  end
end

if $0 == __FILE__
  puts ARGV[0].to_sudden_death
end
