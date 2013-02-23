class QuizController < UIViewController
  attr_accessor :window, :tabbar

  def loadView
    self.view = UIView.alloc.init
    self.view.backgroundColor = UIColor.whiteColor
    self.view.userInteractionEnabled = true
    navigationItem.title = 'Michigan Pistol Safety Quiz'

    @questions = [ { 'q' => "You should treat every pistol as if it were loaded.", 'a' => 'True' },
                   { 'q' => "You should always keep the barrel pointed in a safe direction.", 'a' => 'True' },
                   { 'q' => "You should never put your finger on the trigger until ready to fire at a proper target.", 'a' => 'True' },
                   { 'q' => "When passing or receiving a pistol to or from another person, the action should be open and the pistol visually checked to make sure it is not loaded.", 'a' => 'True' },
                   { 'q' => "It is illegal to sell a pistol to a person under 18 years of age.", 'a' => 'True' },
                   { 'q' => "The law requires a person to report the theft of his or her pistol to police within one year.", 'a' => 'False' },
                   { 'q' => "A person is permitted to transport a pistol for a lawful purpose if the owner or occupant of the vehicle is the registered owner of the firearm and the pistol is unloaded and in a closed case in the trunk of the vehicle.", 'a' => 'True' },
                   { 'q' => "When storing a pistol, for safety reasons the ammunition should never be stored separately from the pistol.", 'a' => 'False' },
                   { 'q' => "The law requires that when presenting a pistol to police for a safety inspection, the pistol is unloaded and encased or equipped with a trigger locking mechanism.", 'a' => 'True' },
                   { 'q' => "When storing a pistol it should be unloaded and placed in a safe place out of the reach of children.", 'a' => 'True' },
                   { 'q' => "Possession of a pistol while under the influence of alcohol is unlawful.", 'a' => 'True' },
                   { 'q' => "A person can be held criminally and civilly liable for wrongfully pointing or discharging a pistol at another person.", 'a' => 'True' },
                   { 'q' => "The first step to cleaning a pistol is to make sure it is unloaded.", 'a' => 'True' },
                   { 'q' => "Dropping a loaded pistol will never cause an accidental discharge if the safety is on.", 'a' => 'False' },
                   { 'q' => "Bullets fired at flat surfaces will never glance off in an unpredictable direction.", 'a' => 'False' } ]

    screen_setup
  end

  def viewWillAppear(animated)
    navigationController.setNavigationBarHidden(true, animated:true)
  end

  def screen_setup
    @margin = 10
    @total = 15
                                                                                                                         
    @question_label = UILabel.new
    @question_label.font = UIFont.systemFontOfSize(24)
    @question_label.backgroundColor = UIColor.clearColor
    @question_label.lineBreakMode = UILineBreakModeWordWrap
    @question_label.numberOfLines = 0
    @question_label.frame = [[@margin, @margin], [310, 260]]
    view.addSubview @question_label

    answer_true = UIButton.buttonWithType(UIButtonTypeCustom)
    answer_true.frame = [[40,275], [64,64]]
    answer_true.setImage(UIImage.imageNamed("checkmark.png"), forState: UIControlStateNormal)
    answer_true.tag = 0
    answer_true.addTarget(self, action:'show_answer:', forControlEvents: UIControlEventTouchUpInside)
    view.addSubview answer_true

    answer_false = UIButton.buttonWithType(UIButtonTypeCustom)
    answer_false.frame = [[220,285], [48,48]]
    answer_false.setImage(UIImage.imageNamed("x.png"), forState: UIControlStateNormal)
    answer_false.tag = 1
    answer_false.addTarget(self, action:'show_answer:', forControlEvents: UIControlEventTouchUpInside)
    view.addSubview answer_false

    @result_label = UILabel.new
    @result_label.font = UIFont.systemFontOfSize(20)
    @result_label.backgroundColor = UIColor.clearColor
    @result_label.textAlignment = UITextAlignmentCenter
    @result_label.frame = [view.frame.size.width + @margin, 340], [300, 30]
    view.addSubview @result_label
                                                                                                                         
    @score_label = UILabel.new
    @score_label.font = UIFont.systemFontOfSize(30)
    @score_label.backgroundColor = UIColor.clearColor
    @score_label.textAlignment = UITextAlignmentCenter
    @score_label.frame = [[120, 380], [80, 30]]
    view.addSubview @score_label

    reset_quiz

    get_question
  end

private
  def show_answer(sender)
    correct = @questions[@index]['a'] == 'True' ? 0 : 1 
    if sender.tag == correct
      @score += 1 
      @result_label.text = "Correct!"
      @result_label.textColor = UIColor.greenColor 
    else
      @result_label.text = "Incorrect! The answer was #{@questions[@index]['a'].downcase}."
      @result_label.textColor = UIColor.redColor 
    end

    @score_label.text = "#{@score}/15"

    if @index == 14
      show_alert('Quiz Complete', "Your final score was #{@score}/15", 'OK')
    else
      get_question
    end
  end

  def get_question
    @index +=1
    @question_label.text = @questions[@index]['q']
    @question_label.frame = [[@margin, @margin], [310, 260]]
    @question_label.sizeToFit
  end

  def reset_quiz
    @questions = @questions.shuffle
    @score = 0
    @index = -1
    @score_label.text = "0/15"
    @result_label.text = ""
    @result_label.textColor = UIColor.blackColor 
  end

  def show_alert(title, message, button)
    alert = UIAlertView.new
    alert.delegate = self
    alert.title = title
    alert.message = message
    alert.addButtonWithTitle(button)
    alert.show
  end

  def alertView(alertView, didDismissWithButtonIndex: indexPath)
    reset_quiz
    get_question
  end

end
