#include "example_project.h"
#include <ruby/encoding.h>

VALUE mExampleProject;

static VALUE example_project_c_code_function()
{
    return some_function();
}

static VALUE example_project_simple_function()
{
    VALUE _string = rb_str_new2("One");
    int _enc = rb_enc_find_index("UTF-8");
    rb_enc_associate_index(_string, _enc);
    return _string;
}

void Init_example_project()
{
  VALUE mExampleProject = rb_define_module("ExampleProject");
  rb_define_singleton_method(mExampleProject, "c_code_function", example_project_c_code_function, 0);
  rb_define_singleton_method(mExampleProject, "simple_function", example_project_simple_function, 0);
}
