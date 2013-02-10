class Contacts < ActiveRecord::Base
  attr_accessible :contacts

  def self.sanitize_contacts(contacts)
    Sanitize.clean(contacts,
      :elements => %w[
        a b br em h1 h2 h3 h4 h5 h6 i img li ol p small strong sub sup table tbody td
        th tr u ul iframe span
      ],
      :attributes => {
        :all => ['dir', 'lang', 'title'],
        'a' => ['href'],
        'img' => ['align', 'alt', 'height', 'src', 'width', 'style'],
        'ol' => ['start', 'reversed', 'type', 'style'],
        'table' => ['summary', 'width', 'style', 'border', 'cellspacing'],
        'td' => ['abbr', 'axis', 'colspan', 'rowspan', 'width'],
        'th' => ['abbr', 'axis', 'colspan', 'rowspan', 'scope', 'width'],
        'ul' => ['type', 'style'],
        'p' => ['style'],
        'iframe' => ['src'],
        'span' => ['style'],
        'li' => ['style']
      },
      :protocols => {
        'a' => {'href' => ['ftp', 'http', 'https', 'mailto', :relative]},
        'img' => {'src' => ['http', 'https', :relative]},
      })
  end
end
