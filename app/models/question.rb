class Question < ActiveHash::Base
  self.data = [
    { id: 1, text: '1+1は？', finish: false },
    { id: 2, text: '質問2', finish: false },
    { id: 3, text: '質問3', finish: false },
    { id: 4, text: '質問4', finish: false },
    { id: 5, text: '質問5', finish: false }
  ]
end
