class LinesToJsonService
  def self.to_json(lines)
    content = ""

    lines.each do |line|
      content += "  '#{line.title}': '#{line.content}', \n"
    end

    return  "{\n#{content[0..content.length - 4]}\n}"
  end
end
