# encoding: utf-8

class DocumentUploader < FileUploader
  def extension_white_list
    %w{doc docx ppt pptx xls xlsx pdf}
  end
end
