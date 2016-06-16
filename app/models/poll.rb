class Poll < ActiveRecord::Base
  has_many :vote_options, dependent: :destroy
  validates :topic, presence: true
  accepts_nested_attributes_for :vote_options, :reject_if => :all_blank, :allow_destroy => true
  belongs_to :user
  belongs_to :category
  
  def normalized_votes_for(option)
  	votes_summary == 0 ? 0 : (option.votes.count.to_f / votes_summary) * 100
  end

  def votes_summary
  	vote_options.inject(0) {|summary, option| summary + option.votes.count}
  end

  def vote_region_quantity
    h = {}
    vote_options.each do |o|
      o.votes.each do |v|
        code = v.state
        if code
          h[code] = 0 unless h.has_key?(code)
          h[code] += 1
        end
      end
    end
    a = []
    h.each do |k,v|
      a << {key: k, val: v, key_alt: AppLib.from_state_to_code(k), scaled_val: v} if AppLib.from_state_to_code(k)
    end
    a.sort!{|x,y| y[:val] <=> x[:val]}
    max = a.size > 0 ? a[0][:val] : nil
    if max 
      a.each{|x| x[:scaled_val] = ((x[:scaled_val]/max.to_f)*100).to_i}
    end
    a
  end

end
