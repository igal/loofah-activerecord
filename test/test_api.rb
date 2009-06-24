require File.expand_path(File.join(File.dirname(__FILE__), 'helper'))

class TestApi < Test::Unit::TestCase

  HTML = "<div>a</div>\n<div>b</div>"
  XML  = "<root><div>a</div>\n<div>b</div></root>"

#   def test_dryopteris_method
#     # Dryopteris(HTML)
#     flunk "not implemented"
#   end

#   def test_dryopteris_html_method
#     # Dryopteris::HTML(HTML)
#     flunk "not implemented"
#   end

#   def test_dryopteris_xml_method
#     # Dryopteris::XML(XML)
#     flunk "not implemented"
#   end

  def test_dryopteris_html_document_method
    doc = Dryopteris::HTML::Document(HTML)
    assert_html_documentish doc
  end

  def test_dryopteris_html_document_parse_method
    doc = Dryopteris::HTML::Document.parse(HTML)
    assert_html_documentish doc
  end

  def test_dryopteris_html_document_fragment_method
    doc = Dryopteris::HTML::DocumentFragment(HTML)
    assert_html_fragmentish doc
  end

  def test_dryopteris_html_document_fragment_parse_method
    doc = Dryopteris::HTML::DocumentFragment.parse(HTML)
    assert_html_fragmentish doc
  end

  def test_dryopteris_xml_document_method
    doc = Dryopteris::XML::Document(XML)
    assert_xml_documentish doc
  end

  def test_dryopteris_xml_document_parse_method
    doc = Dryopteris::XML::Document.parse(XML)
    assert_xml_documentish doc
  end

  def test_dryopteris_xml_document_fragment_method
    doc = Dryopteris::XML::DocumentFragment(XML)
    assert_xml_fragmentish doc
  end

  def test_dryopteris_xml_document_fragment_parse_method
    doc = Dryopteris::XML::DocumentFragment.parse(XML)
    assert_xml_fragmentish doc
  end

  private

  def assert_html_documentish(doc)
    assert_kind_of Nokogiri::HTML::Document,   doc
    assert_kind_of Dryopteris::HTML::Document, doc
    assert_equal HTML, doc.xpath("/html/body").inner_html
  end

  def assert_html_fragmentish(doc)
    assert_kind_of Nokogiri::HTML::DocumentFragment,   doc
    assert_kind_of Dryopteris::HTML::DocumentFragment, doc
    assert_equal HTML, doc.inner_html
  end

  def assert_xml_documentish(doc)
    assert_kind_of Nokogiri::XML::Document,   doc
    assert_kind_of Dryopteris::XML::Document, doc
    assert_equal XML, doc.root.to_s
  end

  def assert_xml_fragmentish(doc)
    assert_kind_of Nokogiri::XML::DocumentFragment,   doc
    assert_kind_of Dryopteris::XML::DocumentFragment, doc
    assert_equal XML, doc.inner_html
  end
end