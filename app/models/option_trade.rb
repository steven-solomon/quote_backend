class OptionTrade < ApplicationRecord
  enum action: {call: 0, put: 1}

  def present
    {
      action: self.action,
      strike: self.strike,
      premium: self.premium
    }
  end
end
