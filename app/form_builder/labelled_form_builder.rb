class LabelledFormBuilder < ActionView::Helpers::FormBUilder

  def text_field(name, *args)
    @template.content_tag :div, class, class: "field" do
      label(name) + @tamplate.tag(:br) + super
    end
  end
end