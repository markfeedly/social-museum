class PageDecorator < Draper::Decorator
  delegate_all

  #todo do I want to refactor code into ci, p and r decorators, or remove this decorator and the default in expose(:page)
end