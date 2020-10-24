class Donation < ApplicationRecord
	belongs_to :user
	# belongs_to :campaign
  belongs_to :program
  after_create :check_completed

  def check_completed
  	if self.program.raised.to_f >= self.program.goal.to_f
  		self.program.update(completed: true)
  		@program = self.program
      puts "Donation Instanceeee after createion from model..." << String(self.program.completed)

  		 ProgramMailer.with(program: @program).notify_super_admin.deliver_later

         puts "Donation Instanceeee after createion from model..." << String(self.program.completed)
  	else
  		  self.program.update(completed: false)
  	end
  end



 end
