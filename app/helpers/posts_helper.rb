module PostsHelper
  def ckeditor_input(form, field)
     result = form.cktext_area field
     if form.object.errors.has_key?(field)
      errors = '<div class="control-group error"><span class="help-inline">'
      errors += form.object.errors[field]*", "
      errors += '</span></div><br/>'
      return ("<div class='ck_error'>".html_safe) + result + ("</div>#{errors}".html_safe)
     end
     result
  end
end
