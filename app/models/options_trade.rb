class OptionsTrade < ApplicationRecord
  enum action: {call: 0, put: 1}
end
