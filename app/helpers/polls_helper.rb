module PollsHelper
  def visualize_votes_for(option)
  	content_tag :div, class: 'progress' do 
  	  content_tag :div, class: "progress-bar #{cycle("progress-bar-success", "progress-bar-info", "progress-bar-warning", "progress-bar-danger", name: "colors")}", style: "width: #{option.poll.normalized_votes_for(option)}%" do
  		  "#{option.title} #{number_to_percentage(option.votes_percentage, precision: 0)}" 
  	  end
  	end
  end
end
