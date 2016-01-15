require 'time'
desc 'create a new draft post'
task :post do
  title = ENV['TITLE']
  slug = "#{Date.today}-#{title.downcase.gsub(/[\s]+/,'-')}"

  file = File.join(
    File.dirname(__FILE__),
    '_posts',
    slug + '.markdown'
  )

  File.open(file, "w") do |f|
    f << <<-EOS.gsub(/^    /, '')
    ---
    layout: post
    title: #{title}
    published: true
    date:   #{Time.now.strftime('%Y-%m-%d %H:%M')}
    categories:
    tags:
    comments: true
    description: more
    ---

    EOS
  end

  system ("#{ENV['EDITOR']} #{file}")
end