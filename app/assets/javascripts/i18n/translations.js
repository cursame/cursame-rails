I18n.translations || (I18n.translations = {});
I18n.translations["en"] = {
  "active_admin": {
    "access_denied": {
      "message": "You are not authorized to perform this action."
    },
    "any": "Any",
    "batch_actions": {
      "action_label": "%{title} Selected",
      "button_label": "Batch Actions",
      "delete_confirmation": "Are you sure you want to delete these %{plural_model}? You won't be able to undo this.",
      "labels": {
        "destroy": "Delete"
      },
      "link": "Create one",
      "selection_toggle_explanation": "(Toggle Selection)",
      "succesfully_destroyed": {
        "one": "Successfully destroyed 1 %{model}",
        "other": "Successfully destroyed %{count} %{plural_model}"
      }
    },
    "blank_slate": {
      "content": "There are no %{resource_name} yet.",
      "entry": {
        "one": "registro",
        "other": "registros"
      },
      "link": "Create one"
    },
    "cancel": "Cancel",
    "comments": {
      "add": "Add Comment",
      "author": "Author",
      "author_type": "Author Type",
      "body": "Body",
      "errors": {
        "empty_text": "Comment wasn't saved, text was empty."
      },
      "no_comments_yet": "No comments yet.",
      "resource": "Resource",
      "resource_type": "Resource Type",
      "title": "Comment",
      "title_content": "Comments (%{count})"
    },
    "create_model": "New %{model}",
    "dashboard": "Dashboard",
    "dashboard_welcome": {
      "call_to_action": "To add dashboard sections, checkout 'app/admin/dashboard.rb'",
      "welcome": "Welcome to Active Admin. This is the default dashboard page."
    },
    "delete": "Delete",
    "delete_confirmation": "Are you sure you want to delete this?",
    "delete_model": "Delete %{model}",
    "details": "%{model} Details",
    "devise": {
      "change_password": {
        "submit": "Change my password",
        "title": "Change your password"
      },
      "links": {
        "forgot_your_password": "Forgot your password?",
        "sign_in": "Sign in",
        "sign_in_with_omniauth_provider": "Sign in with %{provider}"
      },
      "login": {
        "remember_me": "Remember me",
        "submit": "Login",
        "title": "Login"
      },
      "reset_password": {
        "submit": "Reset My Password",
        "title": "Forgot your password?"
      },
      "unlock": {
        "submit": "Resend unlock instructions",
        "title": "Resend unlock instructions"
      }
    },
    "download": "Download:",
    "edit": "Edit",
    "edit_model": "Edit %{model}",
    "empty": "Empty",
    "filters": {
      "buttons": {
        "clear": "Clear Filters",
        "filter": "Filter"
      },
      "predicates": {
        "contains": "Contains",
        "ends_with": "Ends with",
        "equals": "Equals",
        "greater_than": "Greater than",
        "less_than": "Less than",
        "starts_with": "Starts with"
      }
    },
    "has_many_delete": "Delete",
    "has_many_new": "Add New %{model}",
    "has_many_remove": "Remove",
    "index_list": {
      "block": "List",
      "blog": "Blog",
      "grid": "Grid",
      "table": "Table"
    },
    "logout": "Logout",
    "main_content": "Please implement %{model}#main_content to display content.",
    "new_model": "New %{model}",
    "next": "Next",
    "pagination": {
      "empty": "No %{model} found",
      "entry": {
        "one": "entry",
        "other": "entries"
      },
      "multiple": "Displaying %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b> of <b>%{total}</b> in total",
      "multiple_without_total": "Displaying %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b>",
      "one": "Displaying <b>1</b> %{model}",
      "one_page": "Displaying <b>all %{n}</b> %{model}"
    },
    "powered_by": "Powered by %{active_admin} %{version}",
    "previous": "Previous",
    "sidebars": {
      "filters": "Filters"
    },
    "update_model": "Edit %{model}",
    "view": "View"
  },
  "activemodel": {
    "errors": {
      "format": "%{attribute} %{message}",
      "messages": {
        "accepted": "debe ser aceptado",
        "blank": "no puede estar en blanco",
        "confirmation": "no coincide con la confirmación",
        "empty": "no puede estar vacío",
        "equal_to": "debe ser igual a %{count}",
        "even": "debe ser un número par",
        "exclusion": "está reservado",
        "extension_white_list_error": "No puedes subir este tipo de archivo",
        "greater_than": "debe ser mayor que %{count}",
        "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
        "inclusion": "no está incluído en la lista",
        "invalid": "is invalid",
        "invalid_event": "cannot transition when %{state}",
        "invalid_transition": "cannot transition via \"%{event}\"",
        "less_than": "debe ser menor que %{count}",
        "less_than_or_equal_to": "debe ser menor o igual que %{count}",
        "not_a_number": "no es un número",
        "not_an_integer": "debe ser un entero",
        "not_found": " no encontrado.",
        "odd": "debe ser un número non",
        "record_invalid": "La validación falló: %{errors}",
        "taken": "ya ha sido tomado",
        "too_long": {
          "one": "es demasiado largo (máximo 1 caracter)",
          "other": "es demasiado largo (máximo %{count} caracteres)"
        },
        "too_short": {
          "one": "es demasiado corto (mínimo 1 caracter)",
          "other": "es demasiado corto (mínimo %{count} caracteres)"
        },
        "wrong_length": {
          "one": "longitud errónea (debe ser de 1 caracter)",
          "other": "longitud errónea (debe ser de %{count} caracteres)"
        }
      },
      "template": {
        "body": "Revise que los siguientes campos sean válidos:",
        "header": {
          "one": "%{model} no pudo guardarse debido a 1 error",
          "other": "%{model} no pudo guardarse debido a %{count} errores"
        }
      }
    }
  },
  "activerecord": {
    "errors": {
      "format": "%{attribute} %{message}",
      "messages": {
        "accepted": "debe ser aceptado",
        "blank": "no puede estar en blanco",
        "confirmation": "no coincide con la confirmación",
        "empty": "no puede estar vacío",
        "equal_to": "debe ser igual a %{count}",
        "even": "debe ser un número par",
        "exclusion": "está reservado",
        "extension_white_list_error": "No puedes subir este tipo de archivo",
        "greater_than": "debe ser mayor que %{count}",
        "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
        "inclusion": "no está incluído en la lista",
        "invalid": "is invalid",
        "invalid_event": "cannot transition when %{state}",
        "invalid_transition": "cannot transition via \"%{event}\"",
        "less_than": "debe ser menor que %{count}",
        "less_than_or_equal_to": "debe ser menor o igual que %{count}",
        "not_a_number": "no es un número",
        "not_an_integer": "debe ser un entero",
        "not_found": " no encontrado.",
        "odd": "debe ser un número non",
        "record_invalid": "Validation failed: %{errors}",
        "taken": "has already been taken",
        "too_long": {
          "one": "es demasiado largo (máximo 1 caracter)",
          "other": "es demasiado largo (máximo %{count} caracteres)"
        },
        "too_short": {
          "one": "es demasiado corto (mínimo 1 caracter)",
          "other": "es demasiado corto (mínimo %{count} caracteres)"
        },
        "wrong_length": {
          "one": "longitud errónea (debe ser de 1 caracter)",
          "other": "longitud errónea (debe ser de %{count} caracteres)"
        }
      },
      "template": {
        "body": "Revise que los siguientes campos sean válidos:",
        "header": {
          "one": "%{model} no pudo guardarse debido a 1 error",
          "other": "%{model} no pudo guardarse debido a %{count} errores"
        }
      }
    }
  },
  "activities": {
    "show": {
      "avg": "Average:",
      "deliveries": "Deliveries",
      "geo_c": "geocode:",
      "lat": "Lattitue:",
      "long": "Length:",
      "net": "Network:",
      "os": "Operating System:",
      "place": "Place:",
      "title": "Title:",
      "title_act": "Type of Activity:",
      "ver": "Version:",
      "without_act": "No Activities"
    }
  },
  "admin": {
    "form_for_import_users_to_network": {
      "import": "Import File"
    },
    "masive_mailer": {
      "forward": "Forward message to the following number of users",
      "mail": "The forward form will activate when the massive mailer account is larger than 0.",
      "massive_email": "Send massive message to the following users",
      "send_msg": "Send Message",
      "text1": "title",
      "text2": "title",
      "text3": "message",
      "text4": "number of users you want to send message to",
      "text5": "number",
      "text6": "Assigned Password for Message"
    },
    "users": {
      "change_password": {
        "new_pwd": "New Password:"
      }
    }
  },
  "ajax_controller": {
    "error1": "An error ocurred, please try again."
  },
  "assets": {
    "asset_file": {
      "delete": "Delete"
    },
    "messages": {
      "delete": {
        "error": "An error occurred while deleting the file",
        "non_existent": "The file you are trying to delete does not exist",
        "not_an_owner": "You don't have permission to delete this file",
        "success": "The file has been successfully deleted"
      }
    },
    "upload_asset_button": {
      "file": "File"
    }
  },
  "assignments": {
    "correct": "Se ha calificado correctamente la tarea.",
    "error": "Ha ocurrido un error al calificar la tarea.",
    "form_for_delivery": {
      "cancel": "Cancel",
      "descrip": "Description:",
      "dlvry": "Deliver Homework",
      "file_dlvry": "Delivery Files:",
      "save_dlvry": "Save New Delivery",
      "title": "Title:"
    },
    "messages": {
      "create": {
        "error": "Ha ocurrido un error al entregar tu tarea",
        "success": "Your homework has been delivered"
      },
      "update": {
        "error": "Ha ocurrido un error al actualizar tu tarea",
        "success": "Se ha actualizado tu tarea",
        "sucess": "Se ha actualizado tu tarea"
      }
    },
    "responce_of_evaluation": {
      "comments": "Comments",
      "entry": "Entry"
    }
  },
  "attributes": {
    "bios": "Biografía",
    "confirmation_token": "Confirmation email",
    "current_password": "Contraseña actual",
    "email": "Email",
    "first_name": "Nombre",
    "last_name": "Apellido",
    "personal_url": "Dirección de usuario personalizada"
  },
  "calendar": {
    "index": {
      "back_month": "← Last Month",
      "day1": "S",
      "day2": "M",
      "day3": "T",
      "day4": "W",
      "day5": "T",
      "day6": "F",
      "day7": "S",
      "friday": "Saturday",
      "monday": "Monday",
      "next_month": "Next Month →",
      "saturday": "Sunday",
      "sunday": "Sunday",
      "thursday": "Friday",
      "tuesday": "Tuesday",
      "wednesday": "Wednesday"
    }
  },
  "califications": {
    "course": {
      "active_courses": "Active Courses",
      "calification": "Grade:",
      "criterion": "Criterion",
      "final_score": "Final Grade",
      "no_members": "This course has no members",
      "no_printable_score": "Your teacher has not yet given a final grade.",
      "no_score": "You still don't have a final grade.",
      "percent": "Percentage:",
      "score": "Score"
    },
    "member": {
      "final_score": "Final grade:",
      "members": "Members",
      "no_score": "No grade",
      "score": "Cúrsame grade:"
    },
    "shared": {
      "califications_course_header": {
        "califications": "Grades"
      },
      "califications_courses_list": {
        "member": "Member",
        "members": "Members",
        "no_courses": "Not enough courses to see grades.",
        "select_course": "Select Course"
      },
      "califications_header": {
        "active_courses": "Ongoing Courses",
        "califications": "Grades",
        "closed_courses": "Finished Courses",
        "grades": "Grades"
      }
    }
  },
  "comments": {
    "no_exist": "The comment you are trying to view does not exist or has been deleted.",
    "shared": {
      "comment_admin_actions": {
        "confirm": "Are yo sure you want to delete comment?",
        "delete": "Delete"
      },
      "comment_card": {
        "edit_comment": "Edit Comment"
      },
      "comment_user_actions": {
        "denounce_comment": "Report comment"
      }
    }
  },
  "community": {
    "all": {
      "no_records": "No more users to show...",
      "no_usr": "No users not found in this network."
    },
    "search": {
      "no_usr": "No users found in your network.",
      "search": "Search:"
    },
    "shared": {
      "community_header": {
        "all": "All",
        "community": "Community",
        "students": "Students",
        "teacher": "Teachers"
      },
      "community_paginate_button": {
        "load_more": "Upload more"
      },
      "users_search": {
        "find": "Find",
        "search_users": "Search Users..."
      }
    },
    "students": {
      "no_more_usr": "No more users to show...",
      "no_students": "There are still no students in your network."
    },
    "teachers": {
      "no_more_usr": "No more users to show...",
      "no_students": "There are still no teachers in your network."
    }
  },
  "content": {
    "assignments": {
      "adding": {
        "confirm": "Are you sure you want to delete this file?",
        "confirm1": "Are you sure you want to delete content?",
        "delete": "Delete"
      }
    }
  },
  "course_files": {
    "library_item": {
      "confirm": "Are you sure you want to delete this file?",
      "delete": "Delete"
    }
  },
  "courses": {
    "about": {
      "admins": "Admins",
      "course_info": "Course Information",
      "info": "Information",
      "init_date": "Start Date"
    },
    "activities_depot": {
      "act": "Activities",
      "back_to": "Back to course",
      "more_act": "Upload more activities",
      "select_act": "Select activity."
    },
    "all_courses": {
      "no_records": "No more courses to show."
    },
    "clone_course_view": {
      "clone": "Clone",
      "clone2": "(clone)",
      "clone_hmwrks": "Select the homework you want to clone for the new course.",
      "data_course": "Course data",
      "dates": "Dates",
      "delivery_date": "Due date",
      "descrip": "Description",
      "example": "Example: Mathematics I",
      "hmwrks": "Homework",
      "info_new_course": "Change information for new course.",
      "init_date": "Start",
      "name": "Name",
      "privacy": "Privacy",
      "private": "Private",
      "public": "Public",
      "publish_date": "Published on"
    },
    "closure": {
      "closure_members": {
        "final_scores": "Final grades",
        "invite": "Invite students to join your course.",
        "members": "Members",
        "no_members": "There are no members in this course.",
        "no_score": "Ungraded",
        "score": "Grades:",
        "send_scores": "Send final grades to the students of this group."
      },
      "user_closure_overview": {
        "calif": "Grade:",
        "criterium": "Criterium",
        "discuss": "Discussions",
        "example8": "Example: 8",
        "final_score": "Final grade",
        "hmwrk": "Homework",
        "members": "Members",
        "no_rate": "Ungraded",
        "of": "from",
        "participate": "Participated in",
        "percent": "Percentage:",
        "quest": "Test",
        "rate_student": "Grade students",
        "respond": "Answered",
        "score": "Grade",
        "send": "delivered"
      }
    },
    "courses_search": {
      "courses_search": "Search course…",
      "search": "Search"
    },
    "dashboard_deliver": {
      "access": "Quick Access to course administration",
      "activate": "Activate course",
      "calif": "Grades",
      "count_test": "Number of exams answered",
      "desactivate": "Deactivate",
      "hmwrks_course": "Homework in progress",
      "inactive": "Inactive",
      "monitor": "Activity monitor"
    },
    "edit": {
      "edit": "Edit course"
    },
    "edit_delivery_access": {
      "courses": "Courses",
      "delivery_day": "Due Date",
      "descrip": "Description",
      "hmwrk_title": "Homework title",
      "publish": "Publish",
      "publish_date": "Published date"
    },
    "evaluation": {
      "calif": "Grades",
      "course_score": "Course grade",
      "deliver": "Turned in",
      "eval": "Evaluation %",
      "exam": "Exam",
      "final": "Final %",
      "hmwrk": "Homework",
      "items": "Items",
      "no_deliver": "Not turned in",
      "no_group": "You are not part of the group!",
      "no_member": "You have been accepted in this group!",
      "obtained": "Obtained",
      "pdf": "Download (PDF)",
      "percent_obtain": "% obtained",
      "percent_obtain1": "% Obtained",
      "score": "Grade",
      "student": "Student:",
      "total_score": "Grade",
      "unresolved": "Unresolved"
    },
    "evaluation_download": {
      "calif": "Grade",
      "deliver": "Turned in",
      "eval": "Evaluation",
      "eval_percent": "Evaluation percentage",
      "exam": "Exam",
      "final": "Final",
      "hmwrk": "Homework",
      "no_accept": "You have been accepted to the group!",
      "no_part": "You are not part of the group!",
      "not_resolved": "Unresolved",
      "obtain_percent": "Obtained",
      "obtain_percent2": "obtained",
      "ruber": "Items",
      "student": "Student",
      "total_score": "Grade",
      "undelivered": "Not turned in"
    },
    "evaluation_schema": {
      "add_criterium": "Add evaluation criterion",
      "cancel": "Cancel",
      "criterium": "Criterion",
      "percent": "Percentage",
      "save": "Save",
      "text1": "Please specify how you want this course to be evaluated, you may include new evaluation criterion or leave Cúrsame's."
    },
    "form": {
      "add_students": "Subscribe students to this course.",
      "confirm": "Are you sure you want to delete this course?",
      "create": "Create",
      "delete": "Delete permanent course.",
      "descrip": "Description",
      "descrip2": "Description",
      "example": "Example: Mathematics I",
      "find_students": "Find students to automatically join course",
      "first_name": "Write your name or last name.",
      "init_date": "Start Date",
      "name": "Name",
      "privacy": "Privacy",
      "private": "Private",
      "public": "Public",
      "save": "Save changes",
      "students": "Students",
      "teachers": "Teachers"
    },
    "form_course": {
      "descrip": "Description",
      "init_date": "Start date",
      "name": "Name of",
      "privacy": "Privacy",
      "private": "Private",
      "public": "Public",
      "return": "Go back to",
      "update": "Update"
    },
    "index": {
      "student_courses_index": {
        "no_courses": "No courses.",
        "no_show": "No more courses to show."
      },
      "student_header": {
        "course": "Ongoing",
        "courses": "Courses",
        "regist": "Subscribe",
        "request": "Applications"
      },
      "teacher_courses_index": {
        "no_courses": "No courses.",
        "no_show": "No more courses to show."
      },
      "teacher_header": {
        "active": "Active",
        "courses": "Courses",
        "create_course": "Create a new course",
        "finalize": "Finished",
        "new": "New"
      }
    },
    "library": {
      "biblio": "Library",
      "file": "File",
      "files": "Files",
      "load": "Upload more files",
      "no_files": "This course has no files in your library",
      "text2": "Cúrsame will not be made responsible for the content submitted by users, or any copyright infractions. Each user is 100% responsible for his content. If you have any problem of this kind please be dure to report it",
      "upload": "Upload file"
    },
    "light_box_dashboard_delivery": {
      "criterium": "Grading criterion",
      "descrip": "Description",
      "eval": "Please select a percentage from 1 to a 100 to grade this homework.",
      "eval_hmwrk": "Grade homework",
      "files": "Files",
      "hmwrk_score": "Homework grade",
      "percent": "Please select a percentage from 1 to a 100 to grade this homework.",
      "score": "Grade",
      "student": "Student",
      "title": "Title"
    },
    "members": {
      "mem": "Members",
      "no_members": "No members in this course.",
      "no_records": "This course has no members yet."
    },
    "members_in_courses": {
      "course_view_call": {
        "no_courses": "No courses."
      },
      "owner_partial_for_member": {
        "admin": "Admin",
        "student": "Student",
        "teacher": "Teacher"
      },
      "permissionings_edit": {
        "confirm": "Are you sure you want to remove this user from the group?",
        "delete": "Delete",
        "delete_group": "Delete group",
        "usr_accept": "Accept User"
      }
    },
    "new": {
      "new_course": "New Course"
    },
    "old_course": {
      "activate": "Activate course",
      "antique": "Previous courses",
      "deactivate": "Deactivate course"
    },
    "pending": {
      "pending": {
        "no_request": "No more requests to show."
      }
    },
    "search": {
      "courses_search_results": {
        "no_records": "No courses were found under the criterion of this search.",
        "search": "Search:"
      }
    },
    "shared": {
      "course_card": {
        "member": "Member",
        "members": "Member"
      },
      "course_card_actions": {
        "active": "Activate",
        "activities_score": "Grade activities",
        "clone": "Clone",
        "confirm": "Are you sure you want to leave this course?",
        "edit": "Edit",
        "enroll": "You are now enrolled",
        "eval_form": "Evaluation form",
        "final_score": "Final grades",
        "finalize": "Finish",
        "leave": "Leave course",
        "request_send": "Request sent",
        "send_request": "Send Request"
      },
      "course_card_post": {
        "new_course": "New course"
      },
      "course_evaluation_schema_fields": {
        "criterium": "Under what criterion will this be graded?",
        "discuss": "Discussions",
        "hmwrks": "Homework",
        "percent": "Assigned percentage",
        "quest": "Tests"
      },
      "course_header": {
        "active": "Activate",
        "activities_score": "Grade activities",
        "clone": "Clone",
        "edit": "Edit",
        "eval_form": "Evaluation form",
        "final": "Finish",
        "final_score": "Final grades",
        "info": "Information",
        "library": "Library",
        "members": "Members",
        "publ": "Publications",
        "update": "Update photo",
        "update_photo": "Update photo"
      },
      "courses_paginate_button": {
        "load_more": "Upload more..."
      }
    },
    "show": {
      "course-header": {
        "active": "Activate",
        "activities_score": "Grade activities",
        "clone": "Clone",
        "edit": "Edit",
        "eval_form": "Evaluation form",
        "final": "Finish",
        "final_score": "Final grades",
        "info": "Information",
        "library": "Library",
        "members": "Members",
        "publ": "Publications",
        "update": "Update photo",
        "update_photo": "Update photo"
      }
    },
    "statics": {
      "active_hmwrk": "ACTIVE HOMEWORKS",
      "activity": "Activities",
      "discuss": "DISCUSSIONS",
      "generate": "created",
      "in_course": "in the course",
      "quest": "TEST",
      "total": "total"
    },
    "survey_results": {
      "back": "Back",
      "respose": "Anwser",
      "result": "Result",
      "student": "Student"
    },
    "unpublished_courses": {
      "no_courses": "No more courses to show."
    }
  },
  "courses_controller": {
    "active": "was activated correctly.",
    "clone_correct": "Course cloned successfully.",
    "contact": "has ended, contact the teacher for more information.",
    "create": "You have successfully created your course, edit your evaluation form.",
    "delete": "Course deleted successfully.",
    "ended": "was finalized properly.",
    "has_ended": "has ended, you can enable it again in the options menu of the course.",
    "no_accepted": "you have not been accepted into this course.",
    "no_access": "The course you are trying to access does not exist or has been deleted.",
    "no_authorized": "You are not authorized to edit this course.",
    "no_exist": "The course you are trying to view does not exist or has been deleted",
    "save": "The changes in the course have been successfully saved.",
    "search": "Write something in the search field.",
    "success": "It has been created successfully",
    "the_course": "The course",
    "your_course": "Your course"
  },
  "date": {
    "abbr_day_names": [
      "Sun",
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat"
    ],
    "abbr_month_names": [
      null,
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ],
    "day_names": [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday"
    ],
    "formats": {
      "default": "%Y-%m-%d",
      "long": "%B %d, %Y",
      "short": "%b %d"
    },
    "month_names": [
      null,
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ],
    "order": [
      "year",
      "month",
      "day"
    ]
  },
  "datetime": {
    "distance_in_words": {
      "about_x_hours": {
        "one": "about 1 hour",
        "other": "about %{count} hours"
      },
      "about_x_months": {
        "one": "about 1 month",
        "other": "about %{count} months"
      },
      "about_x_years": {
        "one": "about 1 year",
        "other": "about %{count} years"
      },
      "almost_x_years": {
        "one": "almost 1 year",
        "other": "almost %{count} years"
      },
      "half_a_minute": "half a minute",
      "less_than_x_minutes": {
        "one": "less than a minute",
        "other": "less than %{count} minutes"
      },
      "less_than_x_seconds": {
        "one": "less than 1 second",
        "other": "less than %{count} seconds"
      },
      "over_x_years": {
        "one": "over 1 year",
        "other": "over %{count} years"
      },
      "x_days": {
        "one": "1 day",
        "other": "%{count} days"
      },
      "x_minutes": {
        "one": "1 minute",
        "other": "%{count} minutes"
      },
      "x_months": {
        "one": "1 month",
        "other": "%{count} months"
      },
      "x_seconds": {
        "one": "1 second",
        "other": "%{count} seconds"
      }
    },
    "prompts": {
      "day": "Day",
      "hour": "Hour",
      "minute": "Minute",
      "month": "Month",
      "second": "Seconds",
      "year": "Year"
    }
  },
  "deliveries": {
    "deliveries_course": {
      "hmwrks": "Homework that must be turned in in three days or more",
      "hmwrks_last": "past homeworks in the Past section",
      "no_deliver": "You have turned in all your pending homework, you can see previous homework in the previous homework section.",
      "no_hmwrks": "No pending homework for this course",
      "today_hmwrk": "Homework that must be turned in today",
      "tomorrow_hmwrks": "Homework that must be turned in tomorrow"
    },
    "deliveries_courses_lapsed": {
      "last_hmwrks": "We could not find any previous homework."
    },
    "delivery_compart_form": {
      "add_criterium": "Add criterion",
      "cancel": "Cancel",
      "courses": "Courses",
      "criterium": "Evaluation Criterion",
      "dates": "Dates",
      "deliver_date": "Due date",
      "descrip": "Description",
      "example": "Example: Prime numbers",
      "hmwrk_theme": "Subject",
      "integrity": "For the integrity of this activity, you are not allowed to modify files, content and criterion after they have been created. For this reason, if you request any modification we kindly ask you to delete the activity and upload it again. ",
      "publish": "Publish",
      "publish_date": "Date",
      "save": "Save Homework",
      "support": "Support materia"
    },
    "index": {
      "deliver_hmwrks": "Homework that must be turned in in three days or more",
      "hmwrks": "Homework that must be turned in today",
      "no_deliver": "You have turned in all your pending homework, you can see previous homework in the previous homework section.",
      "no_hmwrks": "You have no pending homework to turn in.",
      "past_hmwrks": "past homeworks in the Past section",
      "tomorrow_hmwrks": "Homework that must be turned in tomorrow"
    },
    "lapsed": {
      "no_hmwrks": "We could not find any previous homework."
    },
    "shared": {
      "deliveries_course_header": {
        "active": "Active",
        "hmwrks": "Homework",
        "last": "Previous"
      },
      "deliveries_filter_course": {
        "filter": "Filtrar: ",
        "select": "Selecciona un curso"
      },
      "deliveries_filter_course_header": {
        "filter": "Filter",
        "select": "Select course"
      },
      "deliveries_header": {
        "deliver": "Turn in",
        "hmwrks": "Homework",
        "past": "Past"
      },
      "deliveries_paginate_button": {
        "load": "Upload more"
      },
      "delivery_card": {
        "edit_hmwrk": "Edit homework",
        "hmwrk": "See homework"
      },
      "delivery_modal": {
        "deliver": "deadline",
        "deliver_hmwrk": "Turn in homework",
        "edit": "Edit",
        "final_score": "Final grade",
        "hmwrk": "Homework",
        "rubre": "No comments on this item"
      }
    }
  },
  "deliveries_controller": {
    "access_denied": "You are trying to view Tasks of a course where you have not been accepted.",
    "register": "You are trying to see Tasks of a course where you are not enrroled."
  },
  "devise": {
    "confirmations": {
      "confirmed": "Your account was successfully confirmed. You are now signed in.",
      "new": {
        "email": "Email",
        "email_field": "Please enter your email in the field below to continue with you application",
        "forward": "Forward instructions",
        "no_confirmation": "You have not received a confirmation"
      },
      "send_instructions": "You will receive an email with instructions about how to confirm your account in a few minutes.",
      "send_paranoid_instructions": "If your email address exists in our database, you will receive an email with instructions about how to confirm your account in a few minutes."
    },
    "failure": {
      "already_authenticated": "You are already signed in.",
      "inactive": "Your account was not activated yet.",
      "invalid": "Invalid email or password.",
      "invalid_token": "Invalid authentication token.",
      "locked": "Your account is locked.",
      "not_found_in_database": "Invalid email or password.",
      "timeout": "Your session expired, please sign in again to continue.",
      "unauthenticated": "You need to sign in or sign up before continuing.",
      "unconfirmed": "You have to confirm your account before continuing."
    },
    "mailer": {
      "confirmation_instructions": {
        "push_here": "If the button doesn't work click here",
        "subject": "Confirmation instructions",
        "usage": "To start using your account we need you to confirm you email address. It's very simple! Just click on the next button and you will be ready to use your new learning platform.",
        "welcome": "Welcome to Cúrsame!"
      },
      "reset_password_instructions": {
        "button": "If the button below doesn't work click here",
        "pwd": "If you didn't request to change your password please let us know",
        "reset_password": "To reset your password click on the button below and follow the instructions.",
        "reset_pwd": "Reset password",
        "subject": "Reset password instructions"
      },
      "unlock_instructions": {
        "button": "If the button below doesn't work click here",
        "hello": "Hello!",
        "subject": "Unlock Instructions"
      }
    },
    "omniauth_callbacks": {
      "failure": "Could not authenticate you from %{kind} because \"%{reason}\".",
      "success": "Successfully authenticated from %{kind} account."
    },
    "passwords": {
      "edit": {
        "ch_pwd": "Change password",
        "change_pwd": "Change password",
        "confirm_pwd": "Confirm password",
        "new_pwd": "New password"
      },
      "new": {
        "email": "Write down the email address you provided and click on reactivate password",
        "email_field": "Email",
        "recover_pwd": "Get your password back",
        "res_pwd": "Get password"
      },
      "no_token": "You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided.",
      "send_instructions": "You will receive an email with instructions about how to reset your password in a few minutes.",
      "send_paranoid_instructions": "If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.",
      "updated": "Your password was changed successfully. You are now signed in.",
      "updated_not_active": "Your password was changed successfully."
    },
    "registrations": {
      "destroyed": "Bye! Your account was successfully cancelled. We hope to see you again soon.",
      "edit": {
        "back": "Back",
        "cancel_acount": "Cancel account",
        "down": "Do you want to cancel your account?",
        "edit_usr": "Edit user",
        "pwd": "Password",
        "update": "Update"
      },
      "new": {
        "accept": "Y accept the terms and conditions",
        "access": "We are sorry, the network you are trying to access does not exist",
        "confirm_pwd": "confirm password",
        "email": "email",
        "last_name": "last name",
        "name": "name",
        "no_blocked": "Didn't get the unblock instructions?",
        "no_confirmation": "Didn't get the confirmation instructions?",
        "pwd": "password",
        "question": "ask someone at your school who is in charge, they will know what to do.",
        "registry": "Log in",
        "sign_in": "Already a user? Log in!",
        "thnx": "Thank you!"
      },
      "signed_up": "Welcome! You have signed up successfully.",
      "signed_up_but_inactive": "You have signed up successfully. However, we could not sign you in because your account is not yet activated.",
      "signed_up_but_locked": "You have signed up successfully. However, we could not sign you in because your account is locked.",
      "signed_up_but_unconfirmed": "A message with a confirmation link has been sent to your email address. Please open the link to activate your account.",
      "update_needs_confirmation": "You updated your account successfully, but we need to verify your new email address. Please check your email and click on the confirm link to finalize confirming your new email address.",
      "updated": "You updated your account successfully."
    },
    "sessions": {
      "new": {
        "account_window": "It will lead you to a new window chat will ask for your email so wan can send you the confirmation details.",
        "acount": "Confirm account",
        "antique_usr": "I'm already a user and have some questions",
        "change_pwd": "Please change your password",
        "close": "Close",
        "confirm": "Waiting for confirmation",
        "confirm2": "I still haven't received a confirmation email",
        "confirm3": "I have confirmed my email but forgot to change my password",
        "email": "email",
        "forgot_pwd": "I forgot my password",
        "init": "Home",
        "key": "Is my password still the same?",
        "last_user": "If you used to be a user at the previous platform you are a user of Cúrsame.",
        "link": "click on link",
        "log_in": "sign in",
        "net": "The network you are trying to access does not exist",
        "net2": "ask someone at your school who is in charge, they will know what to do.",
        "new_pwd": "We will provide new passwords, when you confirm your email address with the email we sent.",
        "pwd": "password",
        "pwd_problem": "Any problems relating to password can be resolved by clicking in",
        "remember": "Remember",
        "s_net": "Classes, activities, social networks",
        "s_net2": "Cúrsame connects head teachers, teachers and students",
        "s_net3": "allowing them to interact socially and academically.",
        "s_netn": "Cúrsame connects head teachers, teachers and students allowing them to interact socially and academically",
        "send": "You have sent an email to",
        "send_pwd": "You will receive an email where you will be able to change your password",
        "session": "Log in",
        "sign_in": "New user? Sign in!",
        "sorry": "We are sorry",
        "user": "Am I a user?"
      },
      "signed_in": "Signed in successfully.",
      "signed_out": "Signed out successfully."
    },
    "shared": {
      "footer-links": {
        "help": "Help",
        "privacy": "Privacy",
        "terms": "Terms and conditions"
      },
      "links": {
        "blocked": "Didn't receive unlock instructions?",
        "confirm": "Didn't receive confirmation instructions?",
        "log_in": "Already a user? Log in!",
        "pwd": "Forgot password?",
        "sign_in": "Not registered? Sign in!"
      }
    },
    "unlocks": {
      "new": {
        "email": "email",
        "email_req": "Type your email in the field below so we can follow up your request",
        "forward": "forward instructions",
        "instruc": "Didn't receive unlock instructions?"
      },
      "send_instructions": "You will receive an email with instructions about how to unlock your account in a few minutes.",
      "send_paranoid_instructions": "If your account exists, you will receive an email with instructions about how to unlock it in a few minutes.",
      "unlocked": "Your account has been unlocked successfully. Please sign in to continue."
    }
  },
  "discussions": {
    "correct_edit": "not PASS.",
    "create_discuss": "not PASS.",
    "discussions_course": {
      "no_discuss": "No more discussions to show."
    },
    "form_for_discussion": {
      "add_comment": "Add criterion",
      "calif": "Grade",
      "cancel": "Cancel",
      "create_discuss": "Create discussion",
      "criterium": "Evaluation criterion",
      "dates": "Date",
      "deliver_date": "Due date",
      "descrip": "Description",
      "discuss": "Subject of discussion",
      "example": "Example: Prime Numbers",
      "public": "Publish",
      "publish_date": "Published on:",
      "save_discuss": "Save discussion",
      "support": "Support material"
    },
    "index": {
      "no_discuss": "No more discussions to show."
    },
    "shared": {
      "discussion_card": {
        "edit_discuss": "Edit Discussion",
        "view_discuss": "See Discussion"
      },
      "discussion_modal": {
        "criterium": "Evaluation criterion",
        "grade": "Grade",
        "in_course": "in the course",
        "init_discuss": "You have began a discussion"
      },
      "discussions_course_header": {
        "discuss": "Discussions"
      },
      "discussions_filter_course": {
        "filter": "Filter:",
        "select": "Select course"
      },
      "discussions_header": {
        "discuss": "Discussions"
      },
      "discussions_paginate_button": {
        "load": "Upload more"
      }
    }
  },
  "discussions_controller": {
    "delete": "The argument that you are trying to view does not exist or has been deleted.",
    "no_accepted": "you are trying to view discussions of a course where you have not been accepted.",
    "no_discussion": "Failed to create the discussion.",
    "no_register": "you are trying to view discussions of a course where you are not registered."
  },
  "easy_to_use": "Easy to use",
  "errors": {
    "format": "%{attribute} %{message}",
    "messages": {
      "accepted": "must be accepted",
      "already_confirmed": "was already confirmed, please try signing in",
      "blank": "can't be blank",
      "carrierwave_download_error": "could not be downloaded",
      "carrierwave_integrity_error": "is not of an allowed file type",
      "carrierwave_processing_error": "failed to be processed",
      "confirmation": "doesn't match confirmation",
      "confirmation_period_expired": "needs to be confirmed within %{period}, please request a new one",
      "empty": "can't be empty",
      "equal_to": "must be equal to %{count}",
      "even": "must be even",
      "exclusion": "is reserved",
      "expired": "has expired, please request a new one",
      "extension_black_list_error": "You are not allowed to upload %{extension} files, prohibited types: %{prohibited_types}",
      "extension_white_list_error": "You are not allowed to upload %{extension} files, allowed types: %{allowed_types}",
      "greater_than": "must be greater than %{count}",
      "greater_than_or_equal_to": "must be greater than or equal to %{count}",
      "inclusion": "is not included in the list",
      "invalid": "is invalid",
      "less_than": "must be less than %{count}",
      "less_than_or_equal_to": "must be less than or equal to %{count}",
      "mime_types_processing_error": "Failed to process file with MIME::Types, maybe not valid content-type? Original Error: %{e}",
      "mini_magick_processing_error": "Failed to manipulate with MiniMagick, maybe it is not an image? Original Error: %{e}",
      "not_a_number": "is not a number",
      "not_an_integer": "must be an integer",
      "not_found": "not found",
      "not_locked": "was not locked",
      "not_saved": {
        "one": "1 error prohibited this %{resource} from being saved:",
        "other": "%{count} errors prohibited this %{resource} from being saved:"
      },
      "odd": "must be odd",
      "record_invalid": "La validación falló: %{errors}",
      "rmagick_processing_error": "Failed to manipulate with rmagick, maybe it is not an image? Original Error: %{e}",
      "taken": "ya ha sido tomado",
      "too_long": "is too long (maximum is %{count} characters)",
      "too_short": "is too short (minimum is %{count} characters)",
      "wrong_length": "is the wrong length (should be %{count} characters)"
    },
    "template": {
      "body": "Revise que los siguientes campos sean válidos:",
      "header": {
        "one": "%{model} no pudo guardarse debido a 1 error",
        "other": "%{model} no pudo guardarse debido a %{count} errores"
      }
    }
  },
  "evaluate": {
    "course": {
      "activity": "Activities to grade today",
      "activity_for_days": "Activities to grade in three days or more",
      "activity_for_tmrw": "Activities to grade tomorrow",
      "all": "All activities in this course have been graded, you can see them in",
      "no_activity": "You have no activities to grade",
      "past_activity": "the past activities section"
    },
    "course_inactive": {
      "enrollment": "You must subscribe to at least one course to get graded,",
      "no_score": "You still have no grade."
    },
    "deliveries": {
      "delivery_user_response": {
        "attachments": "Attachments",
        "check_hmwrk": "Grade homework",
        "comments": "Send comments according to the evaluation criterion for this activity.",
        "deliver": "Turn in",
        "deliveries": "Future deadlines",
        "delivery": "Turned in",
        "example": "Example",
        "feedback": "Feedback",
        "message": "Message",
        "no_score": "Ungraded",
        "score": "Grade:",
        "scored": "Grade",
        "student": "Student",
        "title": "Title"
      },
      "evaluate_deliveries": {
        "deliveries": "Future deadlines",
        "no_deliveries": "No deadlines.",
        "no_deliveries_record": "There is still no deadline for this homework.",
        "no_score": "Ungraded",
        "score": "Grade"
      }
    },
    "discussions": {
      "discussion_user_response": {
        "comments": "Comments",
        "example": "Example",
        "feedback": "Feedback",
        "no_score": "Ungraded",
        "rate_student": "Grade student",
        "score": "Grade",
        "send": "Send comments according to the evaluation criterion for this activity."
      },
      "evaluate_discussions": {
        "comment": "Comment",
        "comments": "Comments",
        "discuss": "Discussion",
        "nothing": "No one has participated in the discussion."
      },
      "evaluate_discussions_header": {
        "course": "Course",
        "limit_publish_date": "Deadline to participate",
        "members": "Members",
        "publish_date": "Published on:"
      }
    },
    "inactive": {
      "no_act": "You have not created an activity.",
      "no_activity": "No past activities."
    },
    "index": {
      "all": "All activities in this course have been graded, you can see them in ",
      "no_score": "You have no activities to grade.",
      "past": "the past activities section",
      "someday": "Activities to grade in three days or more",
      "today": "Activities to grade today",
      "tomorrow": "Activities to grade tomorrow"
    },
    "shared": {
      "delivery_activity": {
        "delivery": "Deadline",
        "of": "de"
      },
      "discussion_activity": {
        "members": "Members",
        "of": "of"
      },
      "discussions_sidebar_responses": {
        "members": "Members",
        "no_score": "Ungraded"
      },
      "evaluate_course_filter": {
        "all": "All courses"
      },
      "evaluation_criterium_feedback": {
        "feedback": "Feedback"
      },
      "header_activity_delivery": {
        "course": "Course",
        "delivery": "Deadline",
        "publish_date": "Published on",
        "publish_date_of": "Deadline"
      },
      "header_activity_survey": {
        "answered": "Answered",
        "attemps": "Attemps",
        "course": "Course",
        "deliver_date": "Deadline",
        "of": "of",
        "publish_date": "Published on",
        "the": "the"
      },
      "header_evaluate": {
        "active": "Active",
        "evaluate": "Grade activities",
        "past": "Previous"
      },
      "survey_activity": {
        "answered": "Answered"
      }
    },
    "survey_attemps": {
      "attemps": "Attemps",
      "new_attemp": "New attemp",
      "new_attemp_notice": "Adding this you eliminated the previous qualifying attempt questionnaire."
    },
    "surveys": {
      "evaluate_surveys": {
        "delivery": "Deadlines",
        "no_answer": "This test has not been answered by any student yet.",
        "no_deliveries": "No deadlines.",
        "obtain": "Obtained"
      },
      "survey_user_response": {
        "answers": "Answers",
        "comments": "Send comments.",
        "delivery": "deadlines",
        "feedback": "Feedback",
        "obtain": "obtained",
        "reply": "Answer",
        "send": "send"
      }
    }
  },
  "evaluate_controller": {
    "correct": "Grade assigned correctly.",
    "error": "Failed to qualify the discussion.",
    "no_activity": "You are trying to view an activity that is not yours.",
    "no_calificable": "The discussion that you are trying to view is not qualifiable.",
    "no_evaluate": "You're trying to qualify a course that is not yours.",
    "no_exist": "The discussion that you are trying to view does not exist or has been deleted.",
    "only_teachers": "You're trying to get into a section just for teachers.",
    "send_comment": "Commentary submitted."
  },
  "evaluation_criteria": {
    "form": {
      "eval": "With what criterion will this be evaluated?"
    },
    "form_course": {
      "eval": "What will be evaluated?"
    }
  },
  "flash": {
    "actions": {
      "create": {
        "notice": "%{resource_name} was successfully created."
      },
      "destroy": {
        "alert": "%{resource_name} could not be destroyed.",
        "notice": "%{resource_name} was successfully destroyed."
      },
      "update": {
        "notice": "%{resource_name} was successfully updated."
      }
    }
  },
  "formtastic": {
    "cancel": "Cancelar",
    "create": "Guardar %{model}",
    "false": "No",
    "required": "requerido",
    "reset": "Restablecer %{model}",
    "submit": "Aceptar",
    "true": "Sí",
    "update": "Guardar %{model}"
  },
  "friendships": {
    "new_friendship": "not PASS.",
    "send_friendship": "not PASS."
  },
  "friendships_controller": {
    "delete_usr": "The user has been deleted from your friends",
    "error_usr": "Failed to delete the user from your friends"
  },
  "google_forms": {
    "shared": {
      "card": {
        "edit_form": "Edit Form",
        "view_form": "View Form"
      },
      "dropdown": {
        "courses": "Courses",
        "create_course": "Create course",
        "dropdown_v": {
          "no_course": "You have not created a course yet"
        },
        "public": "Public",
        "return": "Return"
      },
      "form": {
        "cancel": "Cancel",
        "dates": "Dates:",
        "deliver_day": "Delivery date",
        "descrip": "Description: ",
        "form_descrip": "Description of form",
        "form_url": "URL of form",
        "public": "Public",
        "publish": "Publish",
        "publish_date": "Publish date",
        "roles": "Roles: ",
        "title": "Title: ",
        "title2": "Title of Form"
      },
      "google_form_modal": {
        "in_the_course": " in the course",
        "the_form": "The form ",
        "was_created": " was created by"
      }
    },
    "success_form": "Form created successfully"
  },
  "groups": {
    "edit": {
      "name": "Name",
      "update": "Update"
    },
    "new": {
      "create": "Create",
      "name": "Name"
    }
  },
  "hello": "Hello world",
  "helpers": {
    "button": {
      "create": "Create %{model}",
      "submit": "Save %{model}",
      "update": "Update %{model}"
    },
    "page_entries_info": {
      "more_pages": {
        "display_entries": "Displaying %{entry_name} <b>%{first}&nbsp;-&nbsp;%{last}</b> of <b>%{total}</b> in total"
      },
      "one_page": {
        "display_entries": {
          "one": "Displaying <b>1</b> %{entry_name}",
          "other": "Displaying <b>all %{count}</b> %{entry_name}",
          "zero": "No %{entry_name} found"
        }
      }
    },
    "select": {
      "prompt": "Please select"
    },
    "submit": {
      "create": "Create %{model}",
      "helpers": null,
      "submit": "Save %{model}",
      "update": "Update %{model}"
    }
  },
  "home": {
    "about_us": {
      "about_title": {
        "text1": "Cúrsame is a platform founded in Mexico towards the end of the year 2011 by a group of students from different universities throughout Mexico with the aim of improving the education quality and reduce the digital gap through technology. During this period we have succeeded in benefiting more than 100 thousand students, teachers and directives in both private and public schools throughout the country. We want to make an impact on the whole region as well as developing countries. ",
        "text2": "We have received 3 rounds of private investment from avowed foundations, and have been granted a great deal of awards and prices. More importantly, we have managed to link high impact projects to government allowing us to rapidly grow and create a social impact.",
        "title": "About Us"
      },
      "description1_mission": "To improve the quality of Mexican education through an efficient technological tool that allows the educational community to redefine and improve its teaching-learning strategies.",
      "description1_objetives": "To achieve better learning results in the student’s learning while bringing digital inclusion to teachers, students and family members.",
      "description1_philosophy": "In Cúrsame we believe that the learning conception is constructed is not only constructed by one’s own being, but that it deals with more social aspects inside learning communities.",
      "description2_mission": "To democratize the access to a quality technological education, creating a change in the every day and professional lives of students and teachers by bringing the close to technology and its benefits.",
      "description2_objetives": "To promote knowledge exchange in learning communities through diverse communication channels that facilitate the information flow.",
      "description2_philosophy": "To us, the possibility of interaction with others with an educational purpose through technology tools, becomes a very efficient way to favor a possitive and effective educational encounter.",
      "description3_objetives": "Improve time class by making its management more efficient and giving follow up to all activities.",
      "description4_objetives": "Allowing access to a technological quality education to all schools, regardless of their economic or social situation. ",
      "description_vision": "To become a leading platform in the educational scope allowing the Mexican population to become successfully inserted in the information and knowledge society.",
      "mission": "Mission:",
      "objectives": "Objectives:",
      "our_team": {
        "description": "Cúrsame is made up of a passionate group of entrepreneurs, our goal is to generate a positive impact in society through education and technology.",
        "title": "Cúrsame"
      },
      "philosophy": "Philosophy:",
      "vision": "Vision:"
    },
    "apps": {
      "text1": "Download our apps",
      "text2": "Don’t miss out any of your school activities",
      "text3": "Coming soon"
    },
    "chat": {
      "add_friends": "Agrega a tus amigos en la sección de",
      "community": "Comunidad",
      "courses": "Cursos",
      "create": "Crear curso ahora →",
      "cursos": "Cursos",
      "friends": "Amigos",
      "no_create": "No has creado ningún curso todavia.",
      "no_friends": "No tienes amigos.",
      "no_member": "No eres miembro de ningún curso.",
      "offline_usr": "Usuario desconectado",
      "online_usr": "Usuario conectado",
      "section": "Únete a uno en la sección de"
    },
    "contact": {
      "contact_page": {
        "text1": "Fill in the following format and we will get in touch with you in less than 48 hours.",
        "text2": "fields with",
        "text3": "required fields."
      },
      "contact_title": {
        "description": "Would you like to suggest anything to our team, or simply say hello? We’d love to hear from you!",
        "title": "Contact"
      }
    },
    "delete_publication": "We have successfully deleted the publication.",
    "demo": "Request a Demo",
    "edit_comment": "not PASS.",
    "features": {
      "features_content": {
        "characteristic_chat": "Some of its characteristics:",
        "characteristic_comment": "Some of its characteristics:",
        "characteristic_discussion": "Some of its characteristics:",
        "characteristic_homework": "Some of these characteristics are:",
        "characteristic_network": "Some of its characteristics:",
        "characteristic_result": "Some of its characteristics:",
        "characteristic_statisdic": "Some of its characteristics:",
        "characteristic_survey": "Some of its characteristics:",
        "chat": "Chat",
        "comments": "Comments",
        "description_chat": "All users have access to a chat they can use with friends and classmates. Also, each subject has its own group chat where contents are shared in real time.",
        "description_comment": "Allows all community members to privately or publicly comment, creating a social or academic interaction.",
        "description_discussion": "Users are able to begin discussion forums with recommended content for the whole school community to get involved.",
        "description_homework": "It allows teachers to create academic activities for students to respond to from any place without the need of paper and boosting their productivity.",
        "description_network": "All users have a profile to interact with friends, promoting social interaction at school.",
        "description_result": "Users are able to see their educational advance. Teachers can upload grades in real time through a very simple system.",
        "description_statisdic": "School admins have access to a statistics panel where they can see what is happening inside campus. This allows them to witness events and take important decisions having a sustained cause.",
        "description_survey": "Through online tests, teachers are able to evaluate their students in an easy and automatic way. This means they no longer lose class time grading save a great amount of paper.",
        "discussions": "Discussions",
        "feature1_chat": "Individual chat with friends and classmates",
        "feature1_comment": "Public or private",
        "feature1_discussion": "Public or private",
        "feature1_homework": "Course creation",
        "feature1_network": "Find friends",
        "feature1_result": "Grades by subject",
        "feature1_statisdic": "Use of platform tools",
        "feature1_survey": "Creation of one or more courses",
        "feature2_chat": "Group chats for each subject",
        "feature2_comment": "One or more subjects",
        "feature2_discussion": "One or more subjects",
        "feature2_homework": "Deadlines",
        "feature2_network": "Find classmates and teachers",
        "feature2_result": "Individual grades",
        "feature2_statisdic": "Log-in",
        "feature2_survey": "Deadlines",
        "feature3_chat": "File sharing",
        "feature3_comment": "Multimedia content",
        "feature3_discussion": "Recommended content",
        "feature3_homework": "Attachments",
        "feature3_network": "Friend requests",
        "feature3_result": "Activity grades",
        "feature3_statisdic": "Grades",
        "feature3_survey": "Unlimited questions and answers",
        "feature4_chat": "Private messages",
        "feature4_homework": "Recomended content",
        "feature4_network": "Profile interaction",
        "feature4_result": "Exportar a PDF",
        "feature4_statisdic": "By subject",
        "feature4_survey": "Auto evaluation",
        "feature5_homework": "Evaluation",
        "feature5_statisdic": "By teacher",
        "homeworks": "Homework",
        "network": "Community",
        "results": "Grades",
        "statisdics": "Statistics:",
        "surveys": "Tests"
      },
      "features_icons": {
        "chat": "Chat",
        "comments": "Comments",
        "discussions": "Discussions",
        "homeworks": "Homeworks",
        "network": "Community",
        "results": "Grades",
        "statisdics": "Statistics",
        "surveys": "Tests"
      },
      "features_title": {
        "text1": "We offer tools, training and monitoring educational institutions to improve interaction in the process of teaching and learning.",
        "title1": "Method"
      },
      "our_methods": {
        "description_endless": "We want to keep in touch with our users so we can improve the platform together, we are constantly asking for feedback in order to know the user’s needs and satisfy them at our best.",
        "description_implement": "We have a specialized team that is dedicated to visit each campus and show teachers and directives how the platform works and the benefits it brings.",
        "description_support": "In Cúrsame, we keep close to the platform’s users in case they need help or orientation. Our support can be found on chat, tickets and tutorials that can be used at any time.",
        "description_title": "Our method takes into account that a technological platform by itself is not enough to satisfy the needs of students, teachers and directives. For this reason, we work hand in hand with them to achieve greater results. ",
        "description_training": "Before they start to use Cúrsame, all institutions that require technological training are trained by our experts. This way, we fight the digital gap and support teachers to adopt TICs. ",
        "endless": "Follow up",
        "implement": "Implementation",
        "support": "support",
        "title": "It’s not just about technology",
        "training": "Training"
      }
    },
    "help": {
      "help2": "Ayuda",
      "videos": "Video tutoriales en linea."
    },
    "jobs": {
      "job_board": {
        "apply_for_job": "Apply for job!",
        "description1_senior_developer": "We are looking to have the best team to offer our users the best educational platform on the market and create a possitive impact in the educational quality of our country.",
        "description2_senior_developer": "We are looking for a someone that has experience in system management and development.",
        "implementation": "Implementation",
        "offer1_senior_developer": "+ Good, negotiable payment",
        "offer2_senior_developer": "+ Law benifits",
        "offer3_senior_developer": "+ Great work environment",
        "offer4_senior_developer": "+ Bonus according to results.",
        "offer5_senior_developer": "+ Opportunity to work in a company with a great growth potential and the capacity to change the lives of millions of people.",
        "requeriment1_senior_developer": "+ At least 3 years of experience in creating softwere as a service.",
        "requeriment2_senior_developer": "+ At least 2 years of experience development in Ruby, RoR, Phyton or Meteor JS. ",
        "requeriment3_senior_developer": "+ Wants to change the world.",
        "requeriments": "Requeriments:",
        "responsabilities": "Responsabilities:",
        "responsibility1_senior_developer": "+ Planning and managing the Road Map Development of the platform and int new products.",
        "responsibility2_senior_developer": "+ Establish agile work methods for our team.",
        "responsibility3_senior_developer": "+ Organization in the work roles of every team memeber to cover the areas needed.",
        "responsibility4_senior_developer": "+ To participate in the code  creation for a back end in the platform.",
        "vacancies": "Vacancies",
        "we_offer": "We offer:"
      },
      "jobs_title": {
        "text1": "We are working to transform education in Mexico",
        "text2": "Do you want to join our team?",
        "title": "Jobs"
      }
    },
    "landing_page": {
      "cursame_stats": {
        "success_stories_path": "Proyects",
        "title1": "Benefited students",
        "title2": "Benefited schools",
        "title3": "Mexican states"
      },
      "features_showcase": {
        "features_path": "Get to Know our methodology",
        "text1": "It’s really easy and quick to learn how to use Cúrsame, its design and functions make users very simple to adopt it.",
        "text2": "Our tools improve the productivity and reduce the work load for teachers, students and directives.",
        "text3": "Cúrsame can be used from any computer or mobile device, this allows users to create and consult contents regardless of the time or place.",
        "title1": "Easy to use",
        "title2": "Simple and powerful functions",
        "title3": "Multiplatform"
      },
      "intro_homepage_hidden": {
        "request_demo": "Request a demo for your campus!",
        "text1": "Cúrsame is a platform that connects with teachers, students and directives from the same institution.",
        "title1": "Be able to socially and academically interact while improving your learning process"
      },
      "social_impact": {
        "description": "We want to create a possitive impact on society by improving the quality of education, reduce the digital gap and quickly detect the alarms in student communities.",
        "header": "Social impact and compromise",
        "text1_1": "Be able to create personalized follow-up to school work.",
        "text1_2": "With the kind support of our allies we were able to give away servers and tables to schools in vulnerable conditions.",
        "text1_3": "Through different indicators we are able to locate students skipping class",
        "text2_1": "Hand in specialized content according to individual needs.",
        "text2_2": "Support teachers by giving technological training and advice.",
        "text2_3": "Substance consume.",
        "text3_1": "Increase productivity and improve learning.",
        "text3_2": "The platform promoted digital exchange of educational contents.",
        "text3_3": "Bullying.",
        "title1": "Improve the quality of education",
        "title2": "Reduce the digital gap",
        "title3": "Alarm detection"
      },
      "testimonials": {
        "description1": "Cúrsame has been a fundamental development tool and great compliment for classroom teaching, it increases the effective time inside the classroom and helps upload readings, allowing us to save paper.",
        "description2": "He utilizado un sin número de LMS’s, y Cúrsame es la plataforma educativa que mejor se ha adaptado al entorno académico real. Su facilidad de uso y factor social ha provocado que nuestros maestros lo adopten y usen en su trabajo escolar diario beneﬁciando a miles de alumnos.",
        "description3": "La mejor herramienta para la educación. En nuestra experiencia en Media Superior y Superior hemos tenido  el reto de implementar tecnología para la enseñanza sin haber tenido mucho éxito hasta que comenzamos a trabajar con Cúrsame, los resultados han sido bastante satisfactorios.",
        "header": "Testimonies",
        "name1": "Lic. Francisco Fabián Brizuela",
        "name2": "Lic. Alejandro Caballero",
        "name3": "Lic. Katia Águila",
        "title1": "Director del Centro de Innovación Tecnológica Educativa Secundarias Técnicas Distrito Federal",
        "title2": "Subdirector Académico Universidad Tecnológica Emiliano Zapata",
        "title3": "Asesora en Secretaría de Educación Pública - Subsecretaría de Educación Media Superior"
      },
      "user_roles_types": {
        "description": "We think and design tools for teachers, students, directives, and parents of your school community.",
        "header": "Your entire school in one site!",
        "text1": "Take control of your school with real time statistics and communication systems.",
        "text2": "Let the classroom become a learning community, save time and improve your teaching capacities through a social tool.",
        "text3": "Interact with your classmates and teachers. Solve your questions, learn and hand in your dead lines at any place or time.",
        "text4": "Keep an update of your child’s school activities and advances in real time.",
        "title1": "Directives",
        "title2": "Teachers",
        "title3": "Students",
        "title4": "Parents"
      }
    },
    "like": "Like",
    "load_more_notfications": {
      "load_more_notifications": "not PASS."
    },
    "login_form": {
      "log_in": "Iniciar Sesión",
      "pwd": "Olvidé mi contraseña",
      "remember": "Recordarme"
    },
    "mkt_pages": {
      "ad01": {
        "form": "Llena el siguiente formulario y nos pondremos en contacto contigo.",
        "text1": "Las demandas profesionales de la economía global y la sociedad de la información requieren del dominio de herramientas socioculturales para interactuar con conocimientos, tales como el lenguaje y la información; al mismo tiempo requieren de las herramientas físicas, tales como las computadoras, móviles y dispositivos con interfaces cada día más complejas. Usar las herramientas de forma interactiva requiere de algo más que el simple acceso a la herramienta y la destreza técnica requerida para manejar la situación. Los alumnos también necesitan crear y adaptar el conocimiento y las destrezas.",
        "text2": "Hoy se reconoce que las tecnologías de la información y la comunicación ofrecen muchas posibilidades para apoyar los procesos de enseñanza-aprendizaje. Favorecen la motivación, el interés por la materia, la creatividad, la imaginación y los métodos de comunicación, mejoran la capacidad para resolver problemas y el trabajo en grupo, refuerzan la autoestima y permiten mayor autonomía de aprendizaje.",
        "text3": "es una plataforma educativa integral que contribuye a lograr mejores resultados en el aprendizaje de los alumnos y en la inclusión digital de maestros, alumnos y miembros de su familia.",
        "text4": "Su principal característica es que retoma aspectos de los Sistemas de Gestión de Aprendizajes (Learning Activity Management System) y de las redes sociales y los integra en una sola plataforma, facilitando los flujos de información, los intercambios de conocimiento y el trabajo colaborativo a través de comunidades de aprendizaje.",
        "tool": "Herramientas del futuro en la educación de hoy"
      },
      "mkt_thanks": {
        "agent": "Uno de nuestros agentes se comunicará contigo lo más pronto posible.",
        "thnks": "¡Gracias por contactarnos!"
      }
    },
    "new_comment": "not PASS.",
    "not_found": {
      "not_found2": "Lo sentimos, no encontramos la ruta",
      "return": "Regresar al inicio"
    },
    "press": {
      "text1": "Press",
      "text2": "What the press says about Cúrsame."
    },
    "privacidad": {
      "best_product": "Mejora del producto.",
      "description1_who_are_we": "Redes Sociales de Aprendizaje SAPI de CV, better known as Cúrsame",
      "description2_who_are_we": ", is located at",
      "description3_who_are_we": "Pomona 7, Roma Norte, in Mexico City. Zip. 06100, To access our website",
      "description4_who_are_we": " it is responsible for its own use and data protection, which is why we inform you:",
      "personal_data1": "¿Para qué fines utilizaremos sus datos personales?",
      "personal_data2": "De manera adicional, utilizaremos su información personal para las siguientes finalidades secundarias que&nbsp;",
      "personal_data3": "no son necesarias",
      "personal_data4": "&nbsp;para el servicio solicitado, pero que nos permiten y facilitan brindarle una mejor atención",
      "personal_data5": "En caso de que no desee que sus datos personales sean tratados para estos fines secundarios, desde este momento usted nos puede comunicar lo anterior a través del siguiente mecanismo",
      "personal_data6": "Para conocer mayor información sobre los términos y condiciones en que serán tratados sus datos personales, como los terceros con quienes compartimos su información personal y la forma en que podrá ejercer sus derechos ARCO, puede consultar el aviso de privacidad integral en",
      "privacy": "¿Dónde puedo consultar el aviso de privacidad integral?",
      "service": "La negativa para el uso de sus datos personales para estas finalidades no podrá ser un motivo para que le neguemos los servicios y productos que solicita o contrata con nosotros.",
      "support": "A través de nuestro soporte en línea o escribiendo a",
      "title": "Privacy",
      "who_are_we": "Who are we?"
    },
    "request_demo": {
      "text1": "A specialist will visit your campus to show the platform and anwser all of you questions.",
      "text2": "Fill in the following format and we will get in touch with you in less than 48 hours.",
      "text3": "fields with",
      "text4": "required fields.",
      "title": "Ask for a demo"
    },
    "send": "not PASS.",
    "server_error": {
      "conti": "Debido a una contingencia",
      "info": "no es posible mostrar esta información",
      "return": "Regresar al inicio"
    },
    "success_stories": {
      "stories_list": {
        "cobaem": "COBAEM",
        "description_cobaem": "After showing a pilot to 6 of the Colegio de Bachilleres de Estado de México, campuses we found ourselves in need of expansion and now it will be 48 campuses in more than 40 municipalities and more than 50 thousand users benefited by Cúrsame.",
        "description_emprendedores": "This project was created along with the Subsecretary of Higher Secondary Education, Angel Ventures and Ashoka. Cúrsame gives education to enterpreneurs in over 100 high-school campuses throughout the country. It is currently in an expansion process and is willing to reach 1000 campuses in 2014.",
        "description_pilot_tablets": "We are participating on a Federal pilot that will take place in Morelos, Guanajuato, and Querétaro. Our aim is to get education through tablets in Mexico’s primary schools. We are the second place of the 5 final proposals. (IUSA y HP).",
        "description_tecnica_df": "We worked with a pilot of 6 campuses and will now expand to a universe of 120 campuses all over Mexico City.",
        "emprendedores": "Higher Secondary Education Enterpreneurs",
        "pilot_tablets": "Federal pilot with tablets",
        "schools": "Campuses:",
        "students": "Students:",
        "teachers": "Teachers:",
        "tecnica_df": "Secundarias Técnicas del DF",
        "testimonial": "Testimony",
        "testimonial_emprendedores": "“It is the best tool for education. In our experience with higher education, we have tried to implement technology to teaching without having much success until we started working with Cúrsame, we are very pleased with the results.”",
        "testimonial_emprendedores_name": "Lic. Katia Águila",
        "testimonial_emprendedores_title": "Asesora en Secretaría de Educación Pública - Subsecretaría de Educación Media Superior",
        "testimonial_tecnica_df": "“Cúrsame  has been a fundamental development tool. It compliments day by day classwork and increases the effective time inside the classroom. Also, it allows us save paper by uploading our readings, which is a great benefit.\"",
        "testimonial_tecnica_df_name": "Lic. Francisco Fabián Brizuela",
        "testimonial_tecnica_df_title": "Director del Centro de Innovación Tecnológica Educativa Secundarias Técnicas Distrito Federal"
      },
      "success_stories_title": {
        "description_success_stories": "We work along with a great amount of educational institutions, here we show the most relevant cases:",
        "success_stories": "Projects"
      }
    },
    "teacher_day": {
      "happy": "¡Feliz día del Maestro!",
      "text1": "En Cúrsame estamos muy orgullosos de tí y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text2": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text3": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Maestro ¡Te lo mereces!"
    },
    "terms_and_conditions": {
      "terms": "Términos y condiciones del sitio",
      "terms1": "Nuestros servicios están disponibles solamente para los individuos y las empresas del marco educativo (que incluyen pero no restringidos a estos, a las de propietario único) en correcta situación legal que puede firmar contratos legalmente obligatorios y se den derecho a suscribir y tener acceso a nuestros servicios bajo la legislación aplicable. Por lo que el cliente garantiza que está bajo la jurisdicción legal del país al que pertenece y bajo la normatividad del mismo. En consecuencia, el cliente garantiza que está autorizado para hacer negocios y está en correcta situación legal en las jurisdicciones en las cuales hace el negocio (durante el término de este acuerdo), que no es un competidor de Cúrsame, y que la persona que acepta este acuerdo tiene por lo menos dieciocho años de la edad y está capacitado y autorizado para asumir las obligaciones contractuales como cliente.",
      "terms10f": "Tipo de indemnización.",
      "terms10x": "Cúrsame solo indemnizara al usuario en especie, no en ninguna forma monetaria, solo mediante la extensión del tiempo que haya sido contratado el servicio, según el tiempo que haya fallado el mismo.",
      "terms1f": "Requerimientos para tener acceso a los Servicios de Cúrsame.",
      "terms2": "Conforme a los términos y condiciones del presente Acuerdo, Cúrsame se compromete a brindar ciertos Servicios al Cliente. Para los efectos del presente Acuerdo: (a) \"Cliente\" (o \"usted\") se refiere al individuo o a la entidad comercial que utiliza o se registró para utilizar dichos Servicios, incluyendo a sus empleados y agentes; (b) \"Servicios\" de Cúrsame se refiere a todos los servicios interactivos o electrónicos ofrecidos por Cúrsame. Cúrsame Online se reserva el derecho de modificar o interrumpir la prestación de sus Servicios en cualquier momento.",
      "terms2f": "Servicios de Cúrsame.",
      "terms3": "Reconoce que el contenido (excepto el que se carga en Cúrsame) de esta página Web, incluyendo pero no limitándose a información, documentos, productos, logotipos, elementos gráficos y sonidos, gui, software y servicios (llamados colectivamente \"Materiales\"), es provisto por Cúrsame o por sus respectivos autores, diseñadores y vendedores (llamados colectivamente \"Proveedores\") y que Cúrsame y/o sus Proveedores se reservan todos los derechos de propiedad inherentes al mismo. Los elementos de la página Web están protegidos por las leyes aplicables al secreto comercial (trade dress) y por otras leyes que no pueden copiarse ni imitarse en su totalidad o en parte. Cúrsame, el logotipo de Cúrsame y otros productos a los que se hace referencia en el presente son marcas de Cúrsame y pueden estar registradas en ciertas jurisdicciones. Cualquier otro nombre de producto, nombre de la empresa, marcas, logotipos y símbolos pueden ser las marcas comerciales de sus propietarios respectivos.",
      "terms3f": "Propiedad",
      "terms4": "El Cliente reconoce y garantiza que la información que proporciona a Cúrsame en los formularios de información de contacto es verdadera, precisa, actual y completa. El Cliente acuerda mantener y actualizar dicha información para asegurar dichas condiciones. En el caso de que dicha información fuera incorrecta, imprecisa, desactualizada o incompleta, Cúrsame tendrá el derecho de suspender o terminar la cuenta del Cliente y el presente acuerdo.",
      "terms4f": "Información del Cliente",
      "terms5": "El Cliente puede designar a personas como sus agentes para que utilicen los Servicios, siempre que cada persona designada tenga la capacidad legal para realizar acuerdos de cumplimiento obligatorio para el Cliente. Además, el Cliente representa y garantiza que cada persona que se registra con la cuenta del Cliente es un agente autorizado del Cliente (un \"Usuario Autorizado\") que tiene dicha capacidad legal.",
      "terms51": "Usuarios autorizados",
      "terms52": "Responsabilidad de Acceso",
      "terms53": "Responsabilidad por los ID y contraseñas del usuario",
      "terms53x": "El Cliente es el único responsable de mantener la confidencialidad de la información de acceso del Cliente, es decir, IDs y contraseñas de acceso a las cuentas de sus Usuarios Autorizados, y es responsable de todas las actividades que ocurren en su cuenta.",
      "terms54": "Notificación de uso no autorizado",
      "terms54x": "El Cliente debe informarle inmediatamente a Cúrsame si nota cualquier actividad que indicara que su cuenta o información está siendo usada sin autorización, incluyendo: (a) El Cliente recibe la confirmación de una o más órdenes realizadas a través de su cuenta que en realidad nunca realizó o cualquier otro informe conflictivo similar; o (b) el Cliente nota el uso no autorizado de cualquier producto o servicio relacionado con su(s) cuenta(s).",
      "terms5f": "Cuenta del Cliente (membresía de maestro Cúrsame)",
      "terms5x": "El Cliente es el único responsable del acceso y uso de los Servicios (incluyendo todas las actividades y transacciones) por parte de cualquier Usuario Autorizado y/o ID del Usuario registrado bajo la cuenta del Cliente, a menos que dicho acceso o uso de los Servicios sea resultado directo de negligencia por parte de Cúrsame. Es responsabilidad del Cliente, a través de su Usuario Autorizado que administra sus sistemas, permitir el acceso apropiado a cualquiera de los Usuarios Autorizados del Cliente.",
      "terms61f": "Circunstancias especiales",
      "terms61x": "Cúrsame permitirá el acceso a los Servicios y a la información del Cliente a cualquier agente del Cliente (\"Agente Autorizado\") que presente a Cúrsame una carta notariada firmada por un funcionario del Cliente. Dicha carta deberá incluir declaraciones de autenticidad, autorización, y responsabilidad como lo estipula Cúrsame a su sola discreción. El cliente acuerda de forma expresa e irrevocable que Cúrsame puede confiar en dicha carta y en la autorización aparente de esa persona que solicita el acceso a los Servicios o a la cuenta del Cliente. Cúrsame no será responsable ante el Cliente o cualquier tercero por la veracidad de dicha carta o autoridad.",
      "terms6f": "Información del Cliente",
      "terms6x": "El Cliente es el único responsable por la información que almacena en los servidores de Cúrsame. El Cliente controla su información a través de su enlace generado. Cúrsame recomienda a los Clientes que archiven su información de manera regular y frecuente; el Cliente tiene absoluta responsabilidad de archivar su información y será el único responsable por información perdida o irrecuperable. El Cliente acuerda cumplir con las obligaciones legales concernientes a su información. Cúrsame eliminará información del Cliente una vez finalizado el presente Acuerdo. Sin embargo, Cúrsame puede llegar a retener información del Cliente en sus archivos luego de eliminarlo y no será responsable en lo absoluto por dicha información.",
      "terms7": "Uso aceptable",
      "terms71": "Ilegalidad/ Contenido adulto",
      "terms71f": "Cúrsame sanciona y no permite el contenido del sitio o la transmisión de información que contenga material obsceno o ilegal o fomente o promueva actividad ilegal, incluyendo pero no limitándose a juegos, venta de armas ilegales, y la promoción o publicación de cualquier material que pueda violar la legislación de delitos hostiles.",
      "terms71x": "Cúrsame se reserva el derecho a suspender o rescindir inmediatamente y sin previo aviso cualquier cuenta o transmisión que viole esta política. Asimismo, si el Cliente violara esta política, Cúrsame asistirá y cooperará activamente con las agencias policiales y las autoridades gubernamentales al recolectar y ofrecer información sobre el Cliente, el sitio del Cliente, el contenido obsceno o ilegal, y de aquellas personas que puedan haber accedido, adquirido o utilizado de manera inapropiada contenido obsceno o ilícito.",
      "terms72": "Conducta ilícita",
      "terms72x": "El Cliente no cometerá o permitirá la realización de actos dañinos o ilícitos que justifiquen la acción civil, que incluya pero no se limite a la publicación de información privada, escandalosa o difamatoria acerca de una persona sin su consentimiento o que causare intencionalmente angustia emocional.",
      "terms73": "Se prohíben estrictamente las violaciones o intentos de violaciones de los sistemas de Cúrsame, o la interrupción de sus servicios. Dicha violación puede resultar en responsabilidad civil y penal. Sin limitación, los ejemplos de violaciones del sistema incluyen",
      "terms73f": "Acceso e interferencia",
      "terms73x": "Acceso sin autorización o uso de los Servicios de Cúrsame, incluyendo cualquier intento de sondeo, copia o prueba de vulnerabilidad de un sistema o la violación de medidas de seguridad o autenticación sin autorización expresa de Cúrsame; o b) Interferencia con el Servicio a cualquier cliente o sistema, incluyendo, sin limitación, congestión o intento deliberado de sobrecargar un sistema y ataques explícitos; o c) Utilización de cualquier dispositivo, software, o rutina que interfiera o intente interferir con el correcto funcionamiento de los Servicios; o d) Cualquier acción que imponga una carga desproporcionada o inmoderada para la infraestructura de Cúrsame",
      "terms73x1": "El Cliente no deberá desarmar, desmontar, decodificar, extraer, revertir la ingeniería o de otra forma intentar derivar el código fuente del \"software\" (incluyendo los dispositivos, métodos, procesos, e infraestructura) que sustentan los Servicios o cualquier otro software en el sitio Web de Cúrsame. 8.4 Violación de derecho de autor o marca registrada Los Servicios de Cúrsame se pueden utilizar únicamente con propósitos legales. Se prohíbe la transmisión, distribución o almacenamiento de cualquier material en violación a cualquier ley vigente o regulación, incluyendo la exportación de leyes de control. Esto incluye, sin limitación, material protegido por patente, derecho de autor, marca registrada, marca identificada de servicios, secreto de fabricación, u otros derechos de propiedad intelectual. Si utiliza material de terceros, deberá obtener autorización previa. Al utilizar los Servicios, usted representa y garantiza ser el autor y dueño de derechos de autor y/o titular de la licencia con respecto a cualquier contenido alojado y, asimismo, representa y garantiza que ningún contenido viola la marca registrada o los derechos de terceros. Cúrsame se reserva el derecho de suspender o rescindir la(s) transmisión(es) que, a su criterio, violan estas políticas o violan alguna ley o regulación.",
      "terms75": "Mal uso de los recursos del sistema",
      "terms75f": "El Cliente no deberá hacer mal uso de los recursos, que incluyan pero que no se limiten a, empleo del contenido que consume excesivo tiempo en el CPU o espacio de almacenamiento; utilización excesiva de la banda ancha; o reventa del acceso al contenido alojado en los servidores de Cúrsame.",
      "terms76": "Otras actividades",
      "terms76f": "Ya sea lícito o ilícito, Cúrsame se reserva el derecho a determinar qué es perjudicial para sus Clientes, operaciones o reputación, incluyendo actividades que restrinjan o inhiban a algún otro usuario del uso o placer de disfrutar el Servicio o Internet.",
      "terms76x": "Por favor, sea consciente que Cúrsame se reserva el derecho de supervisar, suspender, restringir, suprimir, modificar, o terminar cualquier contenido o transmisión de la cuenta que se considere viola cualquiera de las políticas anteriormente dichas. Si se da el caso, Cúrsame formulará las denuncias pertinentes a las autoridades responsables de la aplicación de la ley, y en tal caso, Cúrsame ayudará activamente a las entidades responsables de aplicar la ley y con la investigación y el proceso de cualquier actividad, incluyendo la entrega de las cuentas de los clientes y de sus datos personales.",
      "terms76x1": "Las quejas sobre violadores de nuestra Política deben enviarse por correo electrónico a politicasvioladas@cursa.me . Se investigará cada queja y puede resultar en la inmediata cancelación de los Servicios, sin previo aviso.",
      "terms7ax": "cargar, publicar, enviar por correo electrónico, transmitir u ofrecer de otra manera cualquier Contenido que propague mensajes de terror o describa tortura o muerte; si es un caso muy serio, se informará a la autoridad legal competente y/o se contactará al correspondiente proveedor de Internet;",
      "terms7bx": "perjudicar a menores, esto incluye cualquier forma de pornografía infantil; si es un caso muy serio, se informará del contenido a la autoridad legal competente y/o se contactará al correspondiente proveedor de Internet; se prohibe publicar cualquier tipo de pornografía.",
      "terms7cx": "cargar, publicar, enviar por correo electrónico u ofrecer de otra manera cualquier Contenido que viole la patente, marca registrada, secreto de fabricación, derecho de autor u otros derechos propietarios de cualquier parte.",
      "terms7dx": "Envío masivo de correo no solicitado (\"Spam\"). Se prohíbe el envío de cualquier forma de Spam a través de los servidores de Cúrsame. Asimismo, también se prohíbe el uso de cualquier recurso de el sitio web de Cúrsame para el envío de Spam de otro proveedor de servicio, anuncio de un sitio Web, o dirección de correo. Las cuentas o los servicios de Cúrsame no pueden ser usados para solicitar información/respuestas de los clientes, mediante mensajes enviados desde otro ISP (Proveedor de Servicios de Internet) donde esos mensajes puedan violar esta política de uso o la del otro proveedor.",
      "terms7ex": "El anuncio, transmisión, o cualquier otra manera de hacer accesible, o el uso de cualquier programa, producto o servicio que esté diseñado para violar los términos y las condiciones de este acuerdo o del uso aceptable de este u otro ISP, incluyendo, aunque de forma no limitada a, facilitar los medios de envío de Spam, iniciación de operaciones de ping, avalancha, bombardeo de correo, o negación de ataques al servicio;",
      "terms7fx": "Reenvío a usuarios de Internet de cualquier sitio web que, si ese sitio web contase con soporte de Cúrsame, supondría la violación de los términos de este acuerdo;",
      "terms7gx": "proveer anonimato a actividades ilegales, fraudulentas o que violen los derechos de propiedad intelectual de una tercera parte;",
      "terms7hx": "conociendo o deliberadamente permitiendo a otros el uso de los servicios de Cúrsame: (i) para cualquier actividad ilegal, invasiva, fraudulenta, difamatoria, o con propósito fraudulento; (ii) para alterar, robar, corromper, inhabilitar, destruir, violar o penetrar en cualquier sistema de seguridad o cifrado de cualquier fichero electrónico, base de datos o red; (iii) para materialmente interferir el uso de la red de Cúrsame de otros clientes o usuarios autorizados; (iv) en violación de las políticas de uso aceptable aplicables al uso de los proveedores de servicios nucleares de Cúrsame, y considerando que usted está avisado de tales políticas o tales políticas está disponibles en lugares públicos de los sitios web de tales proveedores; o (v) de manera que, en opinión de Cúrsame, es contraria a las reglas generalmente aceptadas de etiqueta y de la buena conducta en Internet;",
      "terms7ix": "intentar obtener acceso a otra cuenta o recurso de otro ordenador de propiedad ajena sin autorización del legítimo dueño (por ejemplo \"hacking\");",
      "terms7jx": "obtener o intentar servicios por otros medios o usando dispositivos con la intención de intentar no pagar;",
      "terms7kx": "participar en actividades diseñadas para molestar o que puedan suponer la negación del servicio (por ejemplo ataques sincronizados) a otros usuarios, ya sea en la red de Cúrsame o en la de cualquier otro ISP (Proveedor de Servicios de Internet);",
      "terms7lx": "interferir con el uso o disfrute de la red Cúrsame u otros servicios por parte de otros clientes o usuarios autorizados, incluyendo el uso excesivo de los servicios impidiendo el uso equitativo por parte de otros usuarios de Cúrsame.",
      "terms7mx": "exponer a los proveedores, representantes, directivos, empleados, agentes, asociados o accionistas de Cúrsame a escrutinio público, ridículo o difamación;",
      "terms7nx": "suplantar a cualquier persona o entidad, incluyendo, aunque sin limitarse a ellos, a representantes de Cúrsame, así como falsamente afirmar o inducir a interpretaciones erróneas sobre su personalidad o afiliación a personas o entidades;",
      "terms7ox": "importar de forma paralela cualquier copia de obras con derechos de propiedad intelectual protegida con el objeto de venderla, alquilarla, etc. por provecho, recompensa y/o.",
      "terms7px": "importar o poseer cualquier importación paralela de copias de obras con derechos de propiedad intelectual protegidas, tales como, películas, series de televisión o grabaciones musicales para su reproducción o visionado público, incluyendo, aunque sin limitación, locales de karaoke, restaurantes, tiendas, etc.",
      "terms7x": "Usted acuerda no utilizar los servicios de Cúrsame para",
      "terms8": "Limitación de la responsabilidad",
      "terms8x": "Usted usa Cúrsame bajo su propia responsabilidad. Si usted no está satisfecho con cualquier aspecto de nuestro servicio o con estos términos y condiciones, o algunas otras reglas o políticas, su única solución es finalizar el uso del servicio. Usted explícitamente entiende y acepta que Cúrsame no será responsable por cualquier daño directo, daños accidentales indirectos, fortuitos, especiales, consecuentes, incluyendo pero no limitados a, los daños por la pérdida de beneficios, buena voluntad, uso, datos u otras pérdidas intangibles (incluso si le hemos advertido sobre la posibilidad de tales daños), resultando de: (a) el uso o la incapacidad para utilizar el servicio; (b) el coste de obtención mercancías o servicios alternativos resultado de cualquier mercancía, dato, información comprados o obtenidos o mensajes recibidos o transacciones realizadas en o mediante este servicio; (c) acceso desautorizado a o alteración de sus transmisiones o datos; (d) declaraciones o actuaciones de cualquier tercer parte en el servicio; o (e) cualquier otra asunto relativo al servicio.",
      "terms9f": "Limitación de la responsabilidad de protección a contenidos.",
      "terms9x": "xCúrsame no indemnizará al usuario en fallo del sistema, perdida de su información, jaqueo, destrucción de su información voluntariamente, intento de daño de otro usuario, uso de su información para daño físico, uso de su información para daño moral, uso de su información para cualquier tipo de violación a la ley. No nos hacemos responsables del uso que se le dé a sus contenidos en la red."
    },
    "thnx": "Thank you for using Cúrsame",
    "unlike": "Unlike",
    "wall": {
      "comment": "Comentar"
    }
  },
  "layouts": {
    "sessions": {
      "help": "Help"
    },
    "static_pages": {
      "first_column": {
        "title1": "Cúrsame",
        "title10": "Blog",
        "title2": "Method",
        "title3": "Proyects",
        "title4": "About us",
        "title5": "Press",
        "title6": "Jobs",
        "title7": "Contact",
        "title8": "Get demo",
        "title9": "Applications"
      },
      "fourth_column": {
        "title1": "All rights reserved © 2014 Cúrsame",
        "title2": "See the page in spanish"
      },
      "second_column": {
        "title1": "Help",
        "title2": "Help Center",
        "title3": "Privacy",
        "title4": "Terms and Conditions"
      },
      "third_column": {
        "title1": "Follow us on"
      }
    },
    "super_admin": {
      "activities": "Activities",
      "admin": "Admin",
      "admin_net": "Networks",
      "course_admin": "Course admin",
      "hello": "Hello",
      "statics": "Statistics",
      "super_adm": "Super admins",
      "usr": "Users"
    }
  },
  "libraries": {
    "new": {
      "new_library": "New library"
    },
    "shared": {
      "card": {
        "view_files": "View files"
      },
      "header": {
        "create_folder": "Create folder",
        "library": "Library",
        "upload_file": "Upload file"
      },
      "library_files": {
        "no_documents": "There are no documents."
      }
    }
  },
  "library_directories": {
    "shared": {
      "form": {
        "descrip": "Description: ",
        "lib_descrip": "Description of the library",
        "lib_name": "Title of the library",
        "name": "Name: ",
        "send": "Send"
      },
      "header": {
        "create_folder": "Create folder",
        "library": "Library",
        "upload_file": "Upload file"
      },
      "list": {
        "no_documents": "There are no documents."
      },
      "standalone_card": {
        "open_folder": "Open Folder"
      }
    }
  },
  "library_files": {
    "new": {
      "upload_file": "Upload file"
    },
    "shared": {
      "card": {
        "download_file": "Download file"
      },
      "form": {
        "descrip": "Description: ",
        "descrip_file": "File description",
        "file": "File",
        "file_name": "File name: ",
        "file_name2": "File name",
        "send": "Send"
      },
      "standalone_card": {
        "download_file": "Download file"
      }
    }
  },
  "managers": {
    "bit": {
      "error_connection": "Ocurrio un error, no se pudo acceder a la información de bit",
      "error_course": "Ocurrio un error al crear el curso.",
      "error_user": "No se pudo guardar a el usuario: ",
      "success_importing_group": "Grupo importado correctamente, Se ha creado el curso."
    },
    "comments": {
      "index": {
        "actions": "Actions",
        "comment": "Comment",
        "comment_in": "Comment in",
        "comments1": "Comments",
        "confirm": "Are you sure you want to delete this comment?.",
        "course": "Course",
        "create_date": "Created on:",
        "delete": "Delete",
        "discuss": "Discussion",
        "hmwrk": "Homework",
        "like": "Like",
        "no_user": "No user",
        "public": "Publish",
        "quest": "Test",
        "user": "User",
        "view": "See"
      },
      "show": {
        "author": "Author",
        "back": "Back",
        "comment": "Comment",
        "comment_in": "Comment in",
        "confirm": "Are you sure you want to delete this comment?.",
        "course": "Course",
        "create_date": "Created on",
        "delete": "delete",
        "discuss": "Discussion",
        "hmwrk": "Homework",
        "like": "Like",
        "public": "Public",
        "quest": "Test",
        "user": "User"
      }
    },
    "correct_course": "Course created successfully",
    "correct_deleted": "Comment deleted successfully",
    "course_delete": "Course deleted successfully.",
    "course_error1": "An error occured while creating the course",
    "course_error2": "An error occured while creating the course",
    "course_error3": "An error occured while editing the course",
    "course_error4": "An error occured while deleting the course",
    "courses": {
      "edit": {
        "edit1": "Edit course"
      },
      "index": {
        "actions": "Actions",
        "courses": "Courses",
        "create": "Create course",
        "delete": "Delete",
        "edit": "Edit",
        "inte_date": "Created on",
        "name": "Name",
        "students": "Students",
        "sure": "Are you sure you want to delete this course.",
        "teachers": "Teachers"
      },
      "new": {
        "create_course": "Create course"
      },
      "shared": {
        "form": {
          "add": "Add teachers to this course",
          "cancel": "Cancel",
          "create": "Create course",
          "descrip": "Description",
          "enroll": "Subscribe students to this course.",
          "example": "Example",
          "example2": "Mathematics I",
          "find": "Find teachers to be admins for this course.",
          "find2": "Find students to automatically join the course.",
          "init_date": "Start date",
          "init_date2": "Start date",
          "last_name": "Write down your name or last name.",
          "name": "Name",
          "privacy": "Privacy",
          "private": "Private",
          "public": "Public",
          "save": "Save changes",
          "students": "Students",
          "teachers": "Teachers",
          "write_name": "Write a name or last name."
        },
        "managers_courses_subnav": {
          "list": "List"
        }
      },
      "show": {
        "comments": "Comments",
        "create_date": "Created on:",
        "delete": "Delete",
        "descrip": "description",
        "edit": "Edit",
        "files": "Files",
        "hmwrks": "Homework",
        "quest": "Tests",
        "return": "Back",
        "students": "Students",
        "sure": "Are you sure you want to delete this course.",
        "teachers": "Teachers"
      }
    },
    "create": "User created successfully.",
    "delete_content": "The content has been deleted successfully.",
    "delete_discuss": "Discussion deleted successfully.",
    "delete_error": "An error occurred while deleting the comment '",
    "delete_report": "The report was deleted succesfully.",
    "delete_success_usr": "User deleted successfully",
    "delete_test": "Quiz deleted successfully.",
    "deliveries": {
      "index": {
        "actions": "Actions",
        "course": "Course",
        "delete": "Delete",
        "end_date": "Finished on",
        "hmwrks": "Homework",
        "init_date": "Created on",
        "name": "Name",
        "no_user": "No user",
        "published": "Published",
        "state": "State",
        "sure": "Are you sure you want to delete this homework?",
        "unpublished": "Unpublished",
        "user": "User",
        "view": "View"
      },
      "show": {
        "course": "Course",
        "delete": "Delete",
        "descrip": "Description",
        "end_date": "Deadline",
        "init_date": "Created on",
        "published": "Published",
        "return": "Back",
        "state": "State",
        "sure": "Are you sure you want to delete this test.",
        "teacher": "Teacher",
        "unpublished": "Unpublished"
      }
    },
    "discussions": {
      "index": {
        "actions": "Actions",
        "course": "Course",
        "delete": "Delete",
        "discuss": "Discussions",
        "eval": "Gradable",
        "init_date": "Created on",
        "name": "Name",
        "non_eval": "Ungradable",
        "published": "Published",
        "state": "State",
        "sure": "Are you sure you want to delete this discussion",
        "type": "Type",
        "unpublished": "Unpublished",
        "view": "view"
      },
      "show": {
        "course": "Course",
        "delete": "Delete",
        "descrip": "Description",
        "eval": "Gradable",
        "init_date": "Created on",
        "non_eval": "Ungradable",
        "public": "Public",
        "published": "Published",
        "return": "Back",
        "state": "State",
        "sure": "Are you sure you want to delete this discussion",
        "teacher": "Teacher",
        "type": "Type",
        "unpublished": "Unpublished"
      }
    },
    "edit_correct": "Course edited successfully",
    "edit_error": "Failed to edit user",
    "error_delete_user": "Failed to delete user",
    "error_user": "An error occured when creating the user",
    "file": "File type not supported",
    "hmwrk_delete": "Task deleted successfully.",
    "import_members": {
      "course": "Course",
      "download": "Download course file",
      "import1": "Importar members",
      "import2": "Import course members from data base",
      "import3": "Import user list",
      "import4": "Import?",
      "list": "Import list.",
      "no_file": "FILE NOT FOUND",
      "text1": "It is important to take into account that the files format is fundamental to import the courses correctly.",
      "text2": "The owner may be o to 1, 0 for the owners of courses, and 1 to specify that he is just another member of the course. ",
      "text3": "The email must be associated to the user"
    },
    "index": {
      "actual": "Current",
      "comments": "Comment",
      "courses": "Courses",
      "discuss": "Discussions",
      "exams": "Exams",
      "hmwrks": "Homework",
      "pop": "Expectation number",
      "stat": "Statistics",
      "usr": "Users"
    },
    "mailer": {
      "example": "Example",
      "example2": "Farewell party",
      "masive": "Massive mail",
      "masive2": "Send an email to the members of your community",
      "msg": "Message",
      "send": "Send",
      "subject": "Subject"
    },
    "menu": {
      "admin": "Admin",
      "config": "Configuration",
      "import_cur": "Import courses",
      "import_std": "Import students in course",
      "import_usr": "Import users",
      "masive": "Massive mail",
      "usr": "Users"
    },
    "no_delete": "You can not delete this user.",
    "no_edit": "You can not edit that user.",
    "proc_file": "Your file is being processed, you will receive an email confirmation",
    "reported_contents": {
      "index": {
        "actions": "Actions",
        "author": "Author",
        "delete_content": "Delete content",
        "delete_report": "delete report",
        "report_content": "Content reported",
        "report_date": "Report date",
        "sure": "¿Are you sure you want to delete this content?",
        "sure2": "¿Are you sure you want to delete this report?, The content will not be deleted.",
        "usr": "User",
        "view": "View"
      }
    },
    "settings": {
      "config": "Configuration"
    },
    "shared": {
      "managers_sidebar": {
        "comments": "Comments",
        "config": "Configuration",
        "courses": "Courses",
        "discuss": "Discussions",
        "hmwrk": "Homework",
        "masive": "Massive email",
        "quest": "Tests",
        "report_content": "Content reported",
        "stat": "Statistics",
        "usr": "Users"
      },
      "managers_user_header": {
        "admin": "Admin",
        "edit": "Edit profile",
        "exit": "Log out of admin page",
        "help": "Help",
        "log_out": "Log out"
      }
    },
    "success_usr": "User edited correctly",
    "surveys": {
      "index": {
        "actions": "Actions",
        "course": "Course",
        "delete": "Delete",
        "end_date": "Finished on",
        "init_date": "Created on",
        "name": "Name",
        "no_user": "No user",
        "published": "Published",
        "quest": "Tests",
        "state": "State",
        "sure": "Are you sure you want to delete this test?",
        "unpublished": "Unpublished",
        "user": "User",
        "view": "View"
      },
      "show": {
        "course": "Course",
        "delete": "Delete",
        "end_date": "Finished on",
        "init_date": "Created on",
        "return": "Back",
        "state": "State",
        "sure": "Are you sure you want to delete this homework.",
        "teacher": "Teacher"
      }
    },
    "users": {
      "edit": {
        "edit1": "Edit user"
      },
      "import": {
        "download": "Download user file",
        "import2": "Import users",
        "import3": "Import users from your community from a data base.",
        "import4": "It is important to take into account that the fileÕs format is fundamental to import users correctly.",
        "import5": "Import user file",
        "no_find": "FILE NOT FOUND",
        "text1": "The role can be a student or teacher.",
        "text2": "The email must be the userÕs email."
      },
      "index": {
        "actions": "Actions",
        "create": "Create user",
        "delete": "Delete",
        "edit": "Edit",
        "email": "Email",
        "enroll": "Registered on:",
        "name": "Name",
        "sure": "Are you sure you want to delete this user?.",
        "type": "Type of user",
        "usr": "Users",
        "view": "View"
      },
      "new": {
        "create": "Create user"
      },
      "shared": {
        "form": {
          "admin": "Admin",
          "cancel": "Cancel",
          "create": "Create user",
          "email": "email",
          "last_names": "last name",
          "name": "name",
          "pwd": "password",
          "save": "Save",
          "student": "Student",
          "teacher": "Teacher",
          "type": "type of user"
        },
        "managers_users_subnav": {
          "import": "Import",
          "list": "List"
        }
      },
      "show": {
        "bio": "Bio",
        "delete": "Delete",
        "deliveries": "Homework turned in",
        "edit": "Edit",
        "email": "email",
        "eval": "Participation in graded discussions",
        "info": "Information",
        "last": "Last logged in",
        "quest": "Answered tests",
        "return": "Back",
        "sure": "Are you sure you want to delete this user?.",
        "type": "Type of user"
      }
    }
  },
  "managers_controller": {
    "in_stack": "Your message has been queued for sending."
  },
  "members_in_courses": {
    "create": {
      "enrolled": "You have enllored in the course",
      "request_send": "Request sent"
    }
  },
  "messages": {
    "index": {
      "no_member": "You are not a part of the group!",
      "send": "Send message"
    }
  },
  "messages_controller": {
    "no_send": "You can not send mail to students of the course"
  },
  "meta_search": {
    "or": "or",
    "predicates": {
      "contains": "%{attribute} contains",
      "does_not_contain": "%{attribute} doesn't contain",
      "does_not_end_with": "%{attribute} doesn't end with",
      "does_not_equal": "%{attribute} doesn't equal",
      "does_not_start_with": "%{attribute} doesn't start with",
      "ends_with": "%{attribute} ends with",
      "equals": "%{attribute} equals",
      "greater_than": "%{attribute} greater than",
      "greater_than_or_equal_to": "%{attribute} greater than or equal to",
      "in": "%{attribute} is one of",
      "is_blank": "%{attribute} is blank",
      "is_false": "%{attribute} is false",
      "is_not_null": "%{attribute} isn't null",
      "is_null": "%{attribute} is null",
      "is_present": "%{attribute} is present",
      "is_true": "%{attribute} is true",
      "less_than": "%{attribute} less than",
      "less_than_or_equal_to": "%{attribute} less than or equal to",
      "not_in": "%{attribute} isn't one of",
      "starts_with": "%{attribute} starts with"
    }
  },
  "modal": {
    "delivery_modal": {
      "hmwrk_not_found": "The homework you are trying to view no longer exists, contact the course teacher"
    },
    "discussion_modal": {
      "discussion_not_found": "The discussion you are trying to view no longer exists, contact the teacher course"
    },
    "google_form_modal": {
      "form_not_found": "The form you are trying to view no longer exists, contact the course teacher"
    },
    "reported_content_modal": {
      "publ_not_found": "The post you are trying to denounce no longer exists"
    },
    "survey_modal": {
      "no_modal_found": "The survey you are trying to view no longer exists"
    }
  },
  "networks": {
    "alertmethod": {
      "net": "Go to my network",
      "text1": "You are not a member of the network you are trying to access, we will send you to your correct network so you can log in"
    },
    "awaiting_confirmation": {
      "email": "Check email",
      "log_in": "Log in",
      "send": "We have sent to the instructions to activate your account."
    },
    "create": "A network has been created",
    "form": {
      "api_key": "API Key:",
      "authorization_keyword": "Authorization Keyword",
      "example": "Example: ",
      "form": "Enable public record form.",
      "icon": "Log in image",
      "icon2": "School logo",
      "label": "Labels",
      "msg": "Welcome message",
      "name": "Name",
      "net_evaluable": "Enable network measurables. (Homework, quizzes and measurable discussions)",
      "pop": "Population",
      "pwd": "Confirm password to import users",
      "save": "Save changes",
      "subdomain": "Subdomain"
    },
    "index": {
      "new": "New network"
    },
    "messages": {
      "search": {
        "network": "Network Searcher"
      },
      "update": {
        "success": "Settings successfully saved"
      }
    },
    "network_mask": {
      "enroll": "Register user"
    },
    "new": {
      "new_net": "Create network"
    }
  },
  "networks_users": {
    "index": {
      "no_members": "No members in this network",
      "records": "Registered users in the system"
    },
    "new": {
      "accept": "I accept the terms and conditions of this platform",
      "select": "Select a role",
      "sign_in": "Sign in",
      "suscribe": "Subscribe to network"
    }
  },
  "notifier": {
    "accepted_message": {
      "accept": "You have been accepted to the course",
      "button": "If the button below doesn’t work click here",
      "hello": "¬Hello"
    },
    "csv_import_email": {
      "error": "Erros",
      "hello": "Hello",
      "results": "We have annexed the results of the users import",
      "success": "Success"
    },
    "masive_mailer_for_super_admin": {
      "user": "Dear Cursame Users"
    },
    "new_delivey_notification": {
      "button": "If the button below doesn’t work click here",
      "course_notif": "Current homework",
      "deliver": "Deadline"
    },
    "new_discussion_notification": {
      "button": "If the button above doesn’t work click here",
      "discuss": "Course discussion"
    },
    "new_member_in_course": {
      "button": "If the button above doesn’t work click here",
      "course": "Wants to be part of your course"
    },
    "new_survey_notification": {
      "button": "If the button above doesn’t work click here",
      "deliver": "Deadline",
      "hmwrk": "Current homework"
    },
    "send_comment_on_course": {
      "button": "If the button above doesn’t work click here",
      "comment": "Comment",
      "comment2": "Comment of the course"
    },
    "send_contact_mail": {
      "contact": "Contact",
      "demo": "Request demo",
      "ext": "Extension",
      "msg": "Message",
      "name": "Name",
      "other": "Other",
      "pos": "Position",
      "school": "School",
      "tel": "Phone number"
    },
    "send_email": {
      "msg": "Mail from network admin",
      "net": "Go to network"
    },
    "send_email_members_in_course": {
      "net": "Go to network",
      "notif": "Notifications"
    },
    "send_import_courses": {
      "error": "Error",
      "line": "Line",
      "no_error": "No errors found"
    },
    "send_import_members": {
      "course": "Course",
      "error": "Error",
      "line": "Line",
      "no_error": "No errors found"
    },
    "send_import_users": {
      "error": "Error",
      "line": "Line"
    },
    "user_mailer_with_password": {
      "accept": "You have been accepted to Cúrsame.",
      "active": "Active",
      "hello": "Hello",
      "net": "Go to network",
      "text1": "You can change your password when you log in",
      "text2": "If you cannot see this email",
      "text3": "click here",
      "text4": "Happy teacher’s day!",
      "text5": "In Cúrsame we are very proud of you and the important job you do to improve the education in Mexico, it is a great responsibility to give guidance to the future leaders and citizens of our country",
      "text6": "I would personally like to congratulate you and reiterate our committment with you. The work we do aims to facilitate and strengthen your your teaching capacity. You are a fundamental piece for our platform development, therefore we will continue to improve Cúrsame.",
      "text7": "Your permanent dedication, efforts, perseverance during difficult times and desire of making a better world through education: Happy Teachers Day from the entire Cúrsame team! You deserve it!",
      "welcome": "Welcome",
      "your_pwd": "Your password is"
    }
  },
  "number": {
    "currency": {
      "format": {
        "delimiter": ",",
        "format": "%u%n",
        "precision": 2,
        "separator": ".",
        "significant": false,
        "strip_insignificant_zeros": false,
        "unit": "$"
      }
    },
    "format": {
      "delimiter": ",",
      "precision": 3,
      "separator": ".",
      "significant": false,
      "strip_insignificant_zeros": false
    },
    "human": {
      "decimal_units": {
        "format": "%n %u",
        "units": {
          "billion": "Billion",
          "million": "Million",
          "quadrillion": "Quadrillion",
          "thousand": "Thousand",
          "trillion": "Trillion",
          "unit": ""
        }
      },
      "format": {
        "delimiter": "",
        "precision": 3,
        "significant": true,
        "strip_insignificant_zeros": true
      },
      "storage_units": {
        "format": "%n %u",
        "units": {
          "byte": {
            "one": "Byte",
            "other": "Bytes"
          },
          "gb": "GB",
          "kb": "KB",
          "mb": "MB",
          "tb": "TB"
        }
      }
    },
    "percentage": {
      "format": {
        "delimiter": ""
      }
    },
    "precision": {
      "format": {
        "delimiter": ""
      }
    }
  },
  "polls": {
    "answer_fields": {
      "answer": "Type anwser",
      "correct": "Is this the right anwser?",
      "delete": "Delete"
    },
    "edit": {
      "edit": "Editing survey"
    },
    "index": {
      "list": "List of surveys"
    },
    "question_fields": {
      "add": "Add answer",
      "delete": "Delete",
      "quest": "Type question"
    }
  },
  "publications": {
    "discussion_template": {
      "discuss": "You have began a discussion",
      "in_course": "in the course"
    }
  },
  "registrations": {
    "edit": {
      "bios": "Biography",
      "cancel": "Cancel your account",
      "cancel2": "Cancel",
      "confirm": "Do you want to unsubscribe Cœrsame?",
      "dir": "Address",
      "down": "Do you want to unsubscribe?",
      "edit": "Edit Profile",
      "email": "Email",
      "example": "Example",
      "last_name": "Last name",
      "name": "Name",
      "pwd": "Type your password",
      "text1": "Remember not to use symbols such as",
      "text2": "these will not be accepted in your url",
      "update": "Update profile"
    },
    "edit_user": {
      "back": "Back",
      "cancel": "Cancel your account",
      "down": "Do you want to unsubscribe?",
      "edit": "Edit User",
      "update": "Update"
    },
    "new": {
      "accept": "Accept",
      "confirm_pwd": "Confirm password",
      "confirm_pwd2": "Confirm password",
      "email": "Email",
      "last_name": "Last name",
      "name": "Name",
      "pwd": "Passsword",
      "sign_in": "Sign in",
      "student": "Register as a student",
      "teacher": "Register as a teacher",
      "terms": "Terms and conditions",
      "text1": "We are sorry, the network you are trying does not allow public register. Ask the person in charge at your school to help you.",
      "text2": "Home",
      "type": "Type of user"
    },
    "send_confirmation": {
      "send_confirmation": "The confirmation was sent"
    }
  },
  "registrations_controller": {
    "error": "The profile couldn't be successfully updated",
    "update": "Your profile has been successfully updated"
  },
  "reported_contents": {
    "denounce_fail": "Something happened that your complaint could not be saved",
    "denounce_success": "Your complaint has been completed successfully!",
    "shared": {
      "reported_content_modal": {
        "comment": "Write a comment",
        "help_us": "Help us to understand what's going on",
        "reported_content": "You have already reported this content, the network administrator will take actions.",
        "send": "Send",
        "why_no_content": "Why don't you want to see this content?"
      }
    }
  },
  "shared": {
    "assets_for_assignments": {
      "new_assets": {
        "attach_file": "Attach file"
      }
    },
    "assets_form": {
      "new_assets": {
        "file": "File"
      }
    },
    "chat": {
      "add_message_form": {
        "msg": "Type message and press enter."
      },
      "chat": {
        "more_msg": "Upload more messages...",
        "select": "Select a friend or course to send a message to."
      },
      "load_more_messages": {
        "more_msg": "Upload more messages..."
      },
      "message_notifications": {
        "ago": "Ago",
        "all_msg": "See all messages",
        "msg": "Menssages"
      },
      "message_tpl": {
        "ago": "ago"
      }
    },
    "comment": {
      "comment_main": {
        "like": "like"
      }
    },
    "comment_form": {
      "file": "File",
      "new_publication": {
        "cancel": "Cancel",
        "comment": "Comment",
        "file": "File",
        "public": "Public",
        "save": "Save"
      }
    },
    "comments": {
      "publication_box": {
        "more_comments": "Upload more comments",
        "twlv_likes": "12 Likes",
        "twty_comments": "20 Comments"
      }
    },
    "course_joyride": {
      "joyRideTipContent": {
        "content_area": "This is the area of content creation.",
        "course_descrip": "Here you will find the courses description.",
        "course_edit": "Edit course",
        "create_content": "Content creation",
        "descrip": "description",
        "ed_course": "Here you may edit the course.",
        "edit_course": "Edit course",
        "friends": "Friends",
        "friends_list": "Here you will find you list of friends",
        "notif": "Notifications",
        "notif_area": "This is the notifications area.",
        "profile": "Profile",
        "pub_area": "Here you will find all of the networks publications.",
        "publications": "Publications",
        "sub_profile": "This is the courses profile.",
        "subtitle": "Here you will find everything related to the course.",
        "text_edit_course": "Here you will be able to edit the course.",
        "welcome": "Welcome to the courses profile"
      }
    },
    "delivery_publication_tpl": {
      "category": "category",
      "edit_delivery": "Edit turn in",
      "end_delivery": "Deadline",
      "evaluates": "evaluation",
      "files": "File",
      "final_eval": "Final evaluation",
      "no_evaluation": "This homework will not be graded A",
      "no_reply": "The answers for this homework have not been found",
      "reply": "Anwser",
      "view_delivery": "See homework"
    },
    "dropdown": {
      "dropdown_v": {
        "courses": "Courses",
        "goto_section": "Become a part of the",
        "new_course": "Create a course now",
        "no_course": "You have not created a course yet.",
        "no_member": "You are not a member of any course.",
        "public": "Public",
        "return": "Back"
      },
      "return": "Back"
    },
    "evaluation_criteria": {
      "evaluation_criteria_fields": {
        "criteria_name": "Name of criterion to evaluate"
      }
    },
    "form_commentable": {
      "comment": "Comment",
      "comment_2": "Comment",
      "write_comment": "Write comment"
    },
    "network_joyride": {
      "joyride_tip_content": {
        "courses": "Course creation",
        "description": "In this tour we will show you the new design and tools you will now be able to use in our platform.",
        "description_courses": "When you click on the create button (+) the creation form will appear for you give.",
        "menu": "Menu",
        "menu_description": "You can create comments, homework, discussions and tests in one single place.",
        "text1": "Publish your courses",
        "text10": "In this section you will be able to see your friends or log into a \"community\" to add them",
        "text11": "Interactive menu",
        "text12": "Depending on the section you find yourself in, this meny will show different tools.",
        "text13": "Help video",
        "text14": "If you find a question mark in a section and click on it, you will be able to watch a video showing how to use that function.",
        "text2": "You can choose if your publications are either public for everyone to see, or only for a few users.",
        "text3": "One or many courses",
        "text4": "You will be able to belong to one, two or many courses!.",
        "text5": "Main wall",
        "text6": "Most of your courses publications will appear in your main wall.",
        "text7": "Publication filter",
        "text8": "With the publication filter your may choose the type of publication you would like to see on your wall.",
        "text9": "Friends",
        "welcome": "Welcome to Cúrsame"
      }
    },
    "notification_type": {
      "activity_feed": {
        "accept_course": "You have been accepted to the course",
        "active": "active",
        "activities_p_user": "An activity for",
        "add_to_course": "You have requested to enter the course",
        "comment_course": "comment in your course",
        "comment_net": "comment in your network",
        "comment_profile": "You have commented on your profile.",
        "comment_to_comment": "You have commented on what you have done.",
        "comment_to_homework": "You have commented on the homework",
        "course_calif": "The course has been graded",
        "course_expired": "The course has finished, please deactivate it.",
        "coursework": "from course",
        "discuss_comment": "Comment in your discussion",
        "ended": "Ended",
        "friend_notif": "has sent you a friend request",
        "friend_req": "has accepted your friend request.",
        "homework_calif": "Your homework has been graded",
        "in_course": "in your course",
        "in_course1": "in your course",
        "in_course2": "in your course",
        "in_network": "in your network",
        "lookup_usr": "See user",
        "new_course": "New course",
        "new_discus": "New discussion",
        "new_homework": "New homework",
        "new_question": "New test",
        "one_usr": "a user",
        "quest_feedback": "You have received feedback from your test",
        "quest_response": "You have answered the test",
        "response_homework": "you have done your homework",
        "text15": "The course",
        "text16": "has been",
        "text17": "Your participation in the discussion has been graded",
        "the_course": "The course",
        "view_usr": "View user"
      }
    },
    "notifications": {
      "box_notifications": {
        "more_notif": "See more modifications",
        "no_notif": "No more modifications to show.",
        "notif": "Notifications"
      }
    },
    "post_comments": {
      "comment": "Comment",
      "comment1": "Comment",
      "delte": "Delete",
      "last_comments": "Read previous comments",
      "like": "like",
      "write_comment": "Write comment"
    },
    "post_menu": {
      "comment": "Comment",
      "discussion": "Discussion",
      "form": "Form",
      "homework": "Homework",
      "post_comment": "Leave comment.",
      "questionnaire": "Test",
      "what_are_y_think": "What's on your mind?"
    },
    "posts": {
      "post_admin_actions": {
        "confirm_delete": "Are you sure you want to delete this?",
        "delete": "Delete",
        "edit": "Edit"
      },
      "post_child_comment": {
        "like": "Like",
        "not_like": "Unlike"
      },
      "post_comments": {
        "comment": "Comentar",
        "delete": "delete",
        "like": "like",
        "view_comments": "See previous comments",
        "write_comment": "Write comment"
      },
      "post_comments_list": {
        "non_commentable": "You can no longer comment on this publication.",
        "prev_comments": "Precious comments",
        "write_comment": "Write comment"
      },
      "post_meta_data": {
        "like": "Like",
        "not_like": "Unlike"
      },
      "post_people_who_liked": {
        "ed": "A",
        "liked": "like this"
      }
    },
    "publications": {
      "comment": {
        "course_comment": "comment on course",
        "profile_comment": "comment on courses profile",
        "usr": "User"
      },
      "course": {
        "go_course": "Go to course",
        "new_course": "New public course"
      },
      "delivery": {
        "delivery_txt": "Turn in before",
        "new_homework": "New homework to turn",
        "open_hmwk": "Open homework"
      },
      "discussion": {
        "in_course": "in the course",
        "new": "New discussion",
        "open_discuss": "Open discussion"
      },
      "meta_data": {
        "ago": "ago",
        "at": "at",
        "comments": "Comments",
        "like": "Like"
      },
      "owner_edit_publications": {
        "confirm": "Are you sure you want to delete this?",
        "delete": "delete",
        "edit": "Editar"
      },
      "people_who_likes": {
        "users": "Users who like this"
      },
      "publication_comments": {
        "prev_comments": "See previous comments"
      },
      "publication_template": {
        "edit_publ": "Edit publication"
      },
      "survey": {
        "new_quest": "New test",
        "open_quest": "Open test",
        "question": "Question",
        "questions": "Questions",
        "response_before": "Answer before"
      }
    },
    "publications_filter": {
      "filter_by_course_publications": {
        "filtrate": "Filter",
        "select_course": "Select course"
      }
    },
    "sessions": {
      "network_box_head": {
        "log_in": "Already a user? Log in!",
        "sign_in": "Register"
      },
      "network_not_exist": {
        "no_net_exists": "It seems the school you are trying to access does not existe. Find the person in charge at your school to help you out.",
        "no_network": "The network you are trying to acces was not typed correctly.",
        "ops": "Oops!",
        "search_school": "Find your school here"
      }
    },
    "sidebar": {
      "sidebar_section": {
        "activities": "Activities",
        "add_friends": "Add friends to the",
        "calendar": "Calendar",
        "chat": "Chat",
        "community": "Community",
        "community_href": "Community",
        "course_href": "Courses",
        "course_message": "Become a part of the",
        "courses": "Courses",
        "discussion": "Discussions",
        "disp_usr": "user online",
        "friends": "Friends",
        "goto_section": "Become a part of the",
        "homework": "Homework",
        "initiation": "Home",
        "library": "Library",
        "no_course": "You have not created a course",
        "no_course_href": "Create a course now",
        "no_disp_usr": "user offline",
        "no_friends": "You have no friends.",
        "no_member": "You are not a member of any course.",
        "questionnaire": "Tests",
        "radar": "Radar",
        "ratings": "Grades",
        "return": "back",
        "vLex": "vLex"
      },
      "upcomming_deliveries_widget": {
        "side_section": {
          "pending_homeworks": "Upcoming homework"
        }
      },
      "upcomming_surveys_widget": {
        "side_section": {
          "next_questionnaires": "Upcoming tests"
        }
      }
    },
    "static_pages": {
      "header": {
        "notif": "Oops! It seems your email doesn't match any network.",
        "search_network": "Search network",
        "text1": "Already a user?",
        "text2": "Find your network",
        "text3": "Type your email to access your school network.",
        "title1": "Methodology",
        "title2": "Projects",
        "title3": "Us",
        "title4": "Jobs",
        "title5": "Contact"
      }
    },
    "survey_publication_tpl": {
      "respond_quest": "Answered test"
    },
    "tour": {
      "survey_first_login": {
        "priv": "Privacy policy",
        "quest": "Send survey",
        "text4": "Your data is confidential and will only be used",
        "text5": "to improve our service. Read our",
        "thnx": "Thanks.",
        "title": "Help us improve",
        "title2": "In Cúrsame, your participation is of most importance. Here you will find a few questions that will allow us to improve and offer the best possible tools to fit your needs.",
        "title3": "In Cúrsame, your participation is of most importance. Here you will find a few questions that will allow us to get to know you better. Your answers are confidential and will be used to continuously improve."
      },
      "video_tour_first_time": {
        "loading_tour": "Uploading tour...",
        "wel_text": "Get to know the sections of our platform through this virtual tour.",
        "wel_text1": "In this small introduction video we will show the main sections of your profile.",
        "wel_text2": "In this introduction video we will show you the main sections and characteristics of the course.",
        "welcome": "Welcome to Cúrsame"
      }
    },
    "user_header": {
      "activity_block": {
        "admin_href": "Admin",
        "edit_profile_href": "Edit profile",
        "profile_href": "Go to profile",
        "sign_out_href": "Log out"
      },
      "activity_notifications": {
        "help": "Help"
      }
    },
    "user_joyride": {
      "content": "Content creation",
      "content_area": "This is the area of content creation.",
      "courses": "Courses",
      "courses_area": "This is your course area.",
      "edit_prof": "Edit profile",
      "friends": "Friends",
      "friends_list": "Here you will find a list of your friends",
      "notif": "Notifications",
      "prof": "Profile",
      "prof_photo": "Profile picture.",
      "publ": "Publications",
      "publ_area": "Here you will find all of the networks publications",
      "text_edit_prof": "Here you will be able to edit your profile.",
      "text_notif": "This is your notification area.",
      "text_prof": "Here you will be able to see everything that happens in your Cúrsame network.",
      "welcome_prof": "Welcome to your profile"
    },
    "wall_filters": {
      "all": "All",
      "comments": "Comments",
      "courses": "Courses",
      "discuss": "Discussions",
      "homework": "Homework",
      "quest": "tests"
    },
    "website": {
      "cta_request_demo": {
        "request_demo": "Request a demo for your campus!"
      },
      "other_contact_ways": {
        "follow_us_on_facebook": "Follow us on Facebook",
        "follow_us_on_twitter": "Follow us on Twitter",
        "text1": "Other ways to contact us"
      }
    }
  },
  "superadmin": {
    "activities": {
      "activities": "The activities of this system are geolocalized",
      "activity": "Activity by",
      "avg": "Average grade for homework",
      "avg2": "Average grade for survey",
      "avg3": "Average grade for user",
      "avg4": "Average",
      "comments": "Comments",
      "courses": "Courses",
      "exam": "Tests",
      "exam_delivery": "Turn in exams",
      "find": "Look for activities by user or title",
      "goto": "Go to activity",
      "hmwrks": "Homework",
      "hmwrks_delivery": "Turn in homework",
      "lat": "Latitude",
      "long": "Length",
      "net": "Network",
      "no_act": "no activities",
      "os": "Opperating sustem",
      "place": "Place",
      "sys": "System activities",
      "title": "Title",
      "type": "Type of activity",
      "ver": "Version"
    },
    "courses_sintetic_view_and_edit": {
      "courses": "Courses",
      "hmwrks": "Homework",
      "hmwrks_delivery": "Homework turn in",
      "quest": "Tests",
      "show": "Show courses in networks, members and activities",
      "show2": "Show homework",
      "show3": "Show tests",
      "show4": "Show course statistics",
      "show5": "See turn ins",
      "stat": "Statistics"
    },
    "create_super_admin": {
      "enroll": "Register user",
      "img": "Read the instructions to become a super admin accessing code",
      "superuser": "Cursame super admin"
    },
    "instructions": {
      "create": "Instructions to create a super admin account",
      "link": "Type your name, last name, email and password. Click on continue and you are good to go!"
    },
    "networks": {
      "admin": "Network administration",
      "create": "Create network",
      "create_net": "Creating networks",
      "edit": "Edit",
      "net": "Networks",
      "subdomain": "Subdomain"
    },
    "statics": {
      "activities": "Activities",
      "events": "Events",
      "exam": "Examenes",
      "exam_delivery": "Turn in exams",
      "hmwrks": "Homework",
      "hmwrks_delivery": "Turn in homework",
      "statics1": "System statistics"
    },
    "users": {
      "activities": "Activity manager",
      "discuss": "Discussions",
      "edit1": "Edit user",
      "exam": "Exams",
      "find_usr": "Find user",
      "hmwrks": "Homework",
      "response": "Homework answers",
      "response2": "Exam answers",
      "show1": "Show activities",
      "statics": "Statistics",
      "usr": "User data"
    }
  },
  "support": {
    "array": {
      "last_word_connector": ", and ",
      "two_words_connector": " and ",
      "words_connector": ", "
    }
  },
  "surveys": {
    "ajax": {
      "surveys_paginate_ajax": {
        "no_more_quest": "No more past surveys were found."
      }
    },
    "answer_fields": {
      "correct": "Correct",
      "delete": "Delete",
      "response": "Type answer"
    },
    "correct_create": "Survey successfully created",
    "correct_edit": "Survey correctly edited",
    "form": {
      "add_quest": "Add question",
      "attempts": "Attempts",
      "cancel": "Cancel",
      "courses": "Courses",
      "create": "Create test",
      "dates": "Dates",
      "deliver_date": "Deadline",
      "example": "Example",
      "non_mins": "No time",
      "publish_date": "Published on",
      "quest": "Questions",
      "save": "Save test",
      "support": "Support material",
      "text1": "Prime numbers",
      "timer": "Time",
      "title": "Title"
    },
    "index": {
      "more_days": "Tests to answer in three days or more",
      "no_quest": "You have no pending tests to anwser.",
      "section": "past tests section",
      "see": "See past tests in the",
      "today": "Tests to answer today",
      "tomorrow": "Tests to answer tomorrow"
    },
    "lapsed": {
      "no_quest": "No past tests found."
    },
    "my_surveys": {
      "no_quest": "You have no tests to anwser."
    },
    "question_fields": {
      "add_answer": "Add anwser",
      "quest1": "Add question"
    },
    "select_course": "Select a course to publish survey",
    "shared": {
      "survey_card": {
        "edit": "Edit test",
        "no_limit_time": "You not have more time to answer",
        "notice_helper": "Este cuestionario te dará",
        "notice_helper2": "minutos para responderlo",
        "quest": "See test",
        "solve_time": "Minits"
      },
      "survey_modal": {
        "calif": "Grade",
        "fail_attemps": "You don´t have more attemps",
        "feedback": "Feedback",
        "quest": "Course test",
        "response": "Answer before"
      },
      "survey_questions_modal": {
        "quest": "Send test"
      },
      "surveys_course_header": {
        "past": "past",
        "quest": "Test",
        "response": "anwser"
      },
      "surveys_courses_filter": {
        "filter": "Filter",
        "select": "Select course"
      },
      "surveys_header": {
        "past": "Previous",
        "quest": "Test",
        "response": "Answer"
      },
      "surveys_paginate_button": {
        "load": "Upload"
      }
    },
    "survey_response_tpl": {
      "answer": "Answer",
      "cancel": "Cancel"
    },
    "surveys_course": {
      "more_days": "Tests to answer in three days or more",
      "no_quest": "You have no pending tests to answer for this course.",
      "past": "past tests section",
      "see": "You may see past tests in the",
      "to_day": "Tests to answer today",
      "tomorrow": "Tests to answer tomorrow"
    },
    "surveys_course_lapsed": {
      "quest": "No past tests found."
    }
  },
  "surveys_controller": {
    "no_accept": "You are attempting to view a quiz from a course you have not yet been accepted.",
    "no_exist": "The quiz you are trying to view does not exist or has been deleted.",
    "no_quest_accept": "You are attempting to view a quiz from a course you have not yet been accepted.",
    "no_quest_register": "You are attempting to view a quiz from a course you have not yet been enrolled.",
    "no_register": "You are attempting to view a quiz from a course you have not yet been enrolled."
  },
  "time": {
    "am": "am",
    "formats": {
      "default": "%a, %d %b %Y %H:%M:%S %z",
      "long": "%B %d, %Y %H:%M",
      "short": "%d %b %H:%M"
    },
    "pm": "pm"
  },
  "users": {
    "califications": {
      "deliveries_table": {
        "avg": "Average grade for homework",
        "hmwrk": "Homework",
        "hmwrks": "Homework",
        "no_deliver": "Not turned in",
        "no_hmwrks": "There is still no homework for this course.",
        "no_score": "Nor graded",
        "percent": "Percentage: %{number}%",
        "score": "Grade"
      },
      "discussions_table": {
        "avg_score": "Average discussion grade",
        "discuss": "Discussions",
        "discuss2": "Discussions",
        "no_discuss": "There are still no gradable discussion in this course.",
        "no_part": "No participation",
        "no_score": "Not graded",
        "percent": "Percentage: %{number}%",
        "score": "Grade"
      },
      "enroll": "You need to be enrolled in this course to get graded.",
      "no_score": "You still have no grades.",
      "ratings": "Grades",
      "surveys_table": {
        "avg": "Percentage: %{number}%",
        "exam": "Exams",
        "no_answered": "Not answers",
        "quest": "Tests",
        "quest2": "Average percentage in grades",
        "quest3": "There are still not tests for this course",
        "score": "Grade"
      }
    },
    "courses": {
      "courses2": "Courses",
      "find": "Finsh courses for this section",
      "no_members": "This user is not subscribed to any course.",
      "no_registered": "You are not subscribed to this course."
    },
    "dashboard": {
      "goto": "Go to super admin",
      "log_out": "Log out",
      "select": "Select networks",
      "text1": "When you select network you must log in in the network directed by an independent system."
    },
    "evaluation": {
      "no_members": "This course has no members",
      "score": "Grade"
    },
    "form_course": {
      "cancel": "Cancel",
      "create": "Create new",
      "create2": "Create",
      "descrip": "Description",
      "init_date": "Start date",
      "load": "Loading",
      "name": "Name",
      "private": "Private",
      "public": "Public"
    },
    "friends": {
      "all": "All users",
      "comunity": "Community",
      "find": "Find friends in section",
      "friends_subtitle": {
        "all_friends": "All friends",
        "friends1": "Friends",
        "request": "Pending requests"
      },
      "no_friends": "You still have no friends.",
      "no_friends2": "This user has still no friends"
    },
    "friends_first_user": {
      "friend_req": "Friend request",
      "friends": "Friends",
      "pendent": "Pending requests",
      "send": "Friend request sent"
    },
    "index": {
      "all": "Todos los usuarios"
    },
    "info": {
      "bio": "Bio",
      "email": "Email",
      "info2": "Information",
      "no_bio": "This user has no bio."
    },
    "menu_member": {
      "enroll": "Subscribe to a network",
      "friends": "My friends",
      "net": "my networks"
    },
    "pendding_friends": {
      "no_request": "There are no pending friendship requests"
    },
    "set_password_form": {
      "pwd": "Type password",
      "save": "Save password",
      "set_pwd": "Reset password",
      "welcome": "Welcome to Cursame, you must reset your password to finish the sign in process."
    },
    "shared": {
      "user_card": {
        "add_friends": "Add friends",
        "admin": "Admin",
        "cancel": "Cancel friend request",
        "confirm": "confirm friend request",
        "delete": "Delete friends",
        "delete2": "delete friend request",
        "friends": "Friends",
        "respond": "answer friend request",
        "send_request": "Request sent",
        "student": "Student",
        "teacher": "teacher"
      },
      "user_profile_header": {
        "accept": "Accept friend request",
        "add_friends": "Add friends",
        "cancel": "Cancel friend request",
        "courses": "Course",
        "edit": "Edit profile",
        "friends": "Friends",
        "ignore": "Ignore",
        "info": "Information",
        "publications": "Publications",
        "send": "Request sent",
        "update": "Update",
        "update_photo": "Update photo"
      }
    },
    "show": {
      "add": "Add friend to write on his wall.",
      "no_friend": "You are not friends with user"
    },
    "sufriend": {
      "accept": "Accept friend",
      "name": "Name"
    },
    "waiting_friends": {
      "friends": "Friends waiting",
      "request": "This user has sent you a friend request",
      "waiting_friends": "Waiting to accept your request"
    }
  },
  "users_controller": {
    "canot_delete": "You can not delete this user.",
    "correct_delete": "The user has been successfully deleted",
    "deleted_usr": "The user has already been deleted",
    "no_exist": "The use you are trying to view does not exist or has been deleted.",
    "no_register": "You are no enrolled in any network",
    "save_pwd": "Your password has been saved properly."
  },
  "users_mailer": {
    "notice_to_user": {
      "activity": "You have 5 new activities of the platform.",
      "activitys": "You have 5 new activities of the platform.",
      "goto": "Go to activities",
      "hello": "Hello",
      "notif": "You have five active notifications",
      "welcome": "Welcome"
    },
    "teachers_day": {
      "click": "click here",
      "happy": "¡Feliz día del Maestro!",
      "hello": "Hello",
      "mail": "If you can't read this email",
      "teacher": "Teacher",
      "text1": "En Cúrsame estamos muy orgullosos de ti y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text2": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text3": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Maestro ¡Te lo mereces!"
    }
  },
  "usessions": {
    "new": {
      "confirm": "Waiting for confirmation",
      "email": "email",
      "init_session": "Log in",
      "pwd": "password",
      "remember": "Remember me",
      "send": "An email has been sent to"
    }
  },
  "usessions_controller": {
    "hello": "Hello ",
    "invalid": "The session has not been successfully created due to a wrong email or password.",
    "welcome": " welcome again."
  },
  "views": {
    "home": {
      "header": {
        "cosa": "hi!!"
      }
    },
    "pagination": {
      "first": "&laquo; First",
      "last": "Last &raquo;",
      "next": "Next &rsaquo;",
      "previous": "&lsaquo; Prev",
      "truncate": "&hellip;"
    },
    "shared": {
      "header": {
        "contacto": "Contact",
        "empleos": "Jobs",
        "metodologia": "Metodology",
        "nosotros": "About",
        "proyectos": "Proyects"
      }
    }
  },
  "will_paginate": {
    "next_label": "Next &#8594;",
    "page_entries_info": {
      "multi_page": "Displaying %{model} %{from} - %{to} of %{count} in total",
      "multi_page_html": "Displaying %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b> of <b>%{count}</b> in total",
      "single_page": {
        "one": "Displaying 1 %{model}",
        "other": "Displaying all %{count} %{model}",
        "zero": "No %{model} found"
      },
      "single_page_html": {
        "one": "Displaying <b>1</b> %{model}",
        "other": "Displaying <b>all&nbsp;%{count}</b> %{model}",
        "zero": "No %{model} found"
      }
    },
    "page_gap": "&hellip;",
    "previous_label": "&#8592; Previous"
  }
};
I18n.translations["es"] = {
  "active_admin": {
    "any": "Cualquiera",
    "batch_actions": {
      "action_label": "%{title} seleccionado",
      "button_label": "Acciones en masa",
      "delete_confirmation": "Eliminar %{plural_model}: ¿Está seguro? No podrá deshacer esta acción.",
      "labels": {
        "destroy": "Borrar"
      },
      "link": "Añadir",
      "selection_toggle_explanation": "(Cambiar selección)",
      "succesfully_destroyed": {
        "one": "Se ha destruido 1 %{model} con éxito",
        "other": "Se han destruido %{count} %{plural_model} con éxito"
      }
    },
    "blank_slate": {
      "content": "No hay %{resource_name} aún.",
      "entry": {
        "one": "registro",
        "other": "registros"
      },
      "link": "Añadir"
    },
    "cancel": "Cancelar",
    "comments": {
      "add": "Comentar",
      "author": "Autor",
      "body": "Cuerpo",
      "errors": {
        "empty_text": "El comentario no fue guardado, el texto estaba vacío."
      },
      "no_comments_yet": "Aún sin comentarios.",
      "resource": "Recurso",
      "title": "Comentario",
      "title_content": "Comentarios (%{count})"
    },
    "create_model": "Añadir %{model}",
    "dashboard": "Inicio",
    "dashboard_welcome": {
      "call_to_action": "Para agregar secciones edite 'app/admin/dashboard.rb'",
      "welcome": "Bienvenido a Active Admin. Esta es la página de inicio predeterminada."
    },
    "delete": "Eliminar",
    "delete_confirmation": "¿Está seguro de que quiere eliminar esto?",
    "delete_model": "Eliminar %{model}",
    "details": "Detalles de %{model}",
    "devise": {
      "change_password": {
        "submit": "Cambiar mi contraseña",
        "title": "Cambie su contraseña"
      },
      "links": {
        "forgot_your_password": "¿Olvidó su contraseña?",
        "sign_in": "registrarse",
        "sign_in_with_omniauth_provider": "Conéctate con %{provider}"
      },
      "login": {
        "remember_me": "Recordarme",
        "submit": "iniciar sesión",
        "title": "iniciar sesión"
      },
      "reset_password": {
        "submit": "Restablecer mi contraseña",
        "title": "¿Olvidó su contraseña?"
      }
    },
    "download": "Descargar:",
    "edit": "Editar",
    "edit_model": "Editar %{model}",
    "empty": "Vacío",
    "filters": {
      "buttons": {
        "clear": "Quitar Filtros",
        "filter": "Filtrar"
      },
      "predicates": {
        "contains": "Contiene",
        "ends_with": "Termina con",
        "equals": "Igual a",
        "greater_than": "Mayor que",
        "less_than": "Menor que",
        "starts_with": "Empieza con"
      }
    },
    "has_many_delete": "Eliminar",
    "has_many_new": "Agregar Añadir %{model}",
    "has_many_remove": "Quitar",
    "logout": "Salir",
    "main_content": "Por favor implemente %{model}#main_content para mostrar contenido.",
    "new_model": "Añadir %{model}",
    "next": "Siguiente",
    "pagination": {
      "empty": "No se han encontrado %{model}",
      "multiple": "Mostrando %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b> de un total de <b>%{total}</b>",
      "multiple_without_total": "Mostrando %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b>",
      "one": "Mostrando <b>1</b> %{model}",
      "one_page": "Mostrando <b>un total de %{n}</b> %{model}"
    },
    "powered_by": "Powered by %{active_admin} %{version}",
    "previous": "Anterior",
    "sidebars": {
      "filters": "Filtros"
    },
    "update_model": "Editar %{model}",
    "view": "Ver"
  },
  "activemodel": {
    "errors": {
      "format": "%{attribute} %{message}",
      "messages": {
        "accepted": "debe ser aceptado",
        "blank": "no puede estar en blanco",
        "confirmation": "no coincide con la confirmación",
        "empty": "no puede estar vacío",
        "equal_to": "debe ser igual a %{count}",
        "even": "debe ser un número par",
        "exclusion": "está reservado",
        "extension_white_list_error": "No puedes subir este tipo de archivo",
        "greater_than": "debe ser mayor que %{count}",
        "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
        "inclusion": "no está incluído en la lista",
        "invalid": "es inválido",
        "less_than": "debe ser menor que %{count}",
        "less_than_or_equal_to": "debe ser menor o igual que %{count}",
        "not_a_number": "no es un número",
        "not_an_integer": "debe ser un entero",
        "not_found": " no encontrado.",
        "odd": "debe ser un número non",
        "record_invalid": "La validación falló: %{errors}",
        "taken": "ya ha sido tomado",
        "too_long": {
          "one": "es demasiado largo (máximo 1 caracter)",
          "other": "es demasiado largo (máximo %{count} caracteres)"
        },
        "too_short": {
          "one": "es demasiado corto (mínimo 1 caracter)",
          "other": "es demasiado corto (mínimo %{count} caracteres)"
        },
        "wrong_length": {
          "one": "longitud errónea (debe ser de 1 caracter)",
          "other": "longitud errónea (debe ser de %{count} caracteres)"
        }
      },
      "template": {
        "body": "Revise que los siguientes campos sean válidos:",
        "header": {
          "one": "%{model} no pudo guardarse debido a 1 error",
          "other": "%{model} no pudo guardarse debido a %{count} errores"
        }
      }
    }
  },
  "activerecord": {
    "errors": {
      "format": "%{attribute} %{message}",
      "messages": {
        "accepted": "debe ser aceptado",
        "blank": "no puede estar en blanco",
        "confirmation": "no coincide con la confirmación",
        "empty": "no puede estar vacío",
        "equal_to": "debe ser igual a %{count}",
        "even": "debe ser un número par",
        "exclusion": "está reservado",
        "extension_white_list_error": "No puedes subir este tipo de archivo",
        "greater_than": "debe ser mayor que %{count}",
        "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
        "inclusion": "no está incluído en la lista",
        "invalid": "es inválido",
        "less_than": "debe ser menor que %{count}",
        "less_than_or_equal_to": "debe ser menor o igual que %{count}",
        "not_a_number": "no es un número",
        "not_an_integer": "debe ser un entero",
        "not_found": " no encontrado.",
        "odd": "debe ser un número non",
        "record_invalid": "La validación falló: %{errors}",
        "taken": "ya ha sido tomado",
        "too_long": {
          "one": "es demasiado largo (máximo 1 caracter)",
          "other": "es demasiado largo (máximo %{count} caracteres)"
        },
        "too_short": {
          "one": "es demasiado corto (mínimo 1 caracter)",
          "other": "es demasiado corto (mínimo %{count} caracteres)"
        },
        "wrong_length": {
          "one": "longitud errónea (debe ser de 1 caracter)",
          "other": "longitud errónea (debe ser de %{count} caracteres)"
        }
      },
      "template": {
        "body": "Revise que los siguientes campos sean válidos:",
        "header": {
          "one": "%{model} no pudo guardarse debido a 1 error",
          "other": "%{model} no pudo guardarse debido a %{count} errores"
        }
      }
    }
  },
  "activities": {
    "show": {
      "avg": "Promedio:",
      "deliveries": "Entregas",
      "geo_c": "geocode:",
      "lat": "Latitud:",
      "long": "Longitud:",
      "net": "Red:",
      "os": "Sistema operativo:",
      "place": "Lugar:",
      "title": "Título:",
      "title_act": "Tipo de Actividad:",
      "ver": "Versión:",
      "without_act": "sin actividades"
    }
  },
  "admin": {
    "form_for_import_users_to_network": {
      "import": "Importar archivo de usuarios"
    },
    "masive_mailer": {
      "forward": "Reenviar el mensaje a la siguiente cantidad de usuarios con la clave de mensaje",
      "mail": "Se activará el formulario de reenvio cuando la cuenta de mailers masivos se mayor a 0",
      "massive_email": "Enviar mensajes masivos a los siguientes usuarios",
      "send_msg": "Enviar mensajes",
      "text1": "title",
      "text2": "titulo",
      "text3": "message",
      "text4": "number of users when yo want send",
      "text5": "number",
      "text6": "Esta es la clave asignada al mensaje"
    },
    "users": {
      "change_password": {
        "new_pwd": "Nueva contraseña:"
      }
    }
  },
  "ajax_controller": {
    "error1": "Ocurrió un error, porfavor inténtalo de nuevo."
  },
  "assets": {
    "asset_file": {
      "delete": "Borrar"
    },
    "messages": {
      "delete": {
        "error": "Ha ocurrido un error al eliminar el archivo.",
        "non_existent": "El archivo que intentas borrar no existe.",
        "not_an_owner": "No tienes permisos para eliminar este archivo.",
        "success": "Se ha eliminado el archivo."
      }
    },
    "upload_asset_button": {
      "file": "Archivo"
    }
  },
  "assignments": {
    "correct": "Se ha calificado correctamente la tarea.",
    "error": "Ha ocurrido un error al calificar la tarea.",
    "form_for_delivery": {
      "cancel": "Cancelar",
      "descrip": "Descripción:",
      "dlvry": "Entregar Tarea",
      "file_dlvry": "Archivos de entrega:",
      "save_dlvry": "Guardar nueva entrega",
      "title": "Título:"
    },
    "messages": {
      "create": {
        "error": "Ha ocurrido un error al entregar tu tarea",
        "success": "Se ha entregado tu tarea"
      },
      "update": {
        "error": "Ha ocurrido un error al actualizar tu tarea",
        "success": "Se ha actualizado tu tarea",
        "sucess": "Se ha actualizado tu tarea"
      }
    },
    "responce_of_evaluation": {
      "comments": "Comentarios",
      "entry": "Rubro"
    }
  },
  "attributes": {
    "bios": "Biografía",
    "confirmation_token": "El correo electrónico de confirmación",
    "current_password": "Contraseña actual",
    "email": "Correo electrónico",
    "first_name": "Nombre",
    "last_name": "Apellido",
    "personal_url": "Dirección de usuario personalizada"
  },
  "calendar": {
    "index": {
      "back_month": "← Mes anterior",
      "day1": "D",
      "day2": "L",
      "day3": "M",
      "day4": "M",
      "day5": "J",
      "day6": "V",
      "day7": "S",
      "friday": "Viernes",
      "monday": "Lunes",
      "next_month": "Mes siguiente →",
      "saturday": "Sabado",
      "sunday": "Domingo",
      "thursday": "Jueves",
      "tuesday": "Martes",
      "wednesday": "Miercoles"
    }
  },
  "califications": {
    "course": {
      "active_courses": "Cursos activos",
      "calification": "Calificación:",
      "criterion": "Criterio",
      "final_score": "Calificación final",
      "no_members": "Este curso no tiene miembros",
      "no_printable_score": "Tu profesor todavia no te ha dado calificación final.",
      "no_score": "Aún no tienes calificación final.",
      "percent": "Porcentaje:",
      "score": "Calificación Obtenida"
    },
    "member": {
      "final_score": "Calificación final:",
      "members": "Miembros",
      "no_score": " Sin Calificar",
      "score": "Calificación Cúrsame:"
    },
    "shared": {
      "califications_course_header": {
        "califications": "Calificaciones"
      },
      "califications_courses_list": {
        "member": "Miembro",
        "members": "Miembros",
        "no_courses": "No hay cursos para ver calificaciones.",
        "select_course": "Selecciona un curso"
      },
      "califications_header": {
        "active_courses": "Cursos activos",
        "califications": "Calificaciones",
        "closed_courses": "Cursos finalizados",
        "grades": "Calificaciones"
      }
    }
  },
  "comments": {
    "no_exist": "El comentario que intentas ver no existe o ha sido borrado.",
    "shared": {
      "comment_admin_actions": {
        "confirm": "¿Estas seguro de borrar este comentario?",
        "delete": "Borrar"
      },
      "comment_card": {
        "edit_comment": "Editar Comentario"
      },
      "comment_user_actions": {
        "denounce_comment": "Denunciar comentario"
      }
    }
  },
  "community": {
    "all": {
      "no_records": "No hay más usuarios por mostrar...",
      "no_usr": "No se encontraron usarios en tu red."
    },
    "search": {
      "no_usr": "No se encontraron usarios en tu red.",
      "search": "Búsqueda:"
    },
    "shared": {
      "community_header": {
        "all": "Todos",
        "community": "Comunidad",
        "students": "Estudiantes",
        "teacher": "Profesores"
      },
      "community_paginate_button": {
        "load_more": "Cargar más..."
      },
      "users_search": {
        "find": "Buscar",
        "search_users": "Buscar usuarios..."
      }
    },
    "students": {
      "no_more_usr": "No hay más usuarios por mostrar...",
      "no_students": "Aún no hay estudiantes en tu red."
    },
    "teachers": {
      "no_more_usr": "No hay más usuarios por mostrar...",
      "no_students": "Aún no hay profesores en tu red."
    }
  },
  "content": {
    "assignments": {
      "adding": {
        "confirm": "¿Eliminar archivo?",
        "confirm1": "¿Eliminar contenido?",
        "delete": "Borrar"
      }
    }
  },
  "course_files": {
    "library_item": {
      "confirm": "¿Estas seguro de querer eliminar este archivo?",
      "delete": "Borrar"
    }
  },
  "courses": {
    "about": {
      "admins": "Administradores del curso",
      "course_info": "Información del Curso",
      "info": "Información.",
      "init_date": "Fecha de incio"
    },
    "activities_depot": {
      "act": "Actividades",
      "back_to": "Regresar al curso",
      "more_act": "Cargar más actividades",
      "select_act": "Selecciona una actividad."
    },
    "all_courses": {
      "no_records": "No hay más cursos para mostrar."
    },
    "clone_course_view": {
      "clone": "Clonar curso",
      "clone2": "(clonado)",
      "clone_hmwrks": "Selecciona las tareas que quieres clonar para el nuevo curso.",
      "data_course": "Datos del curso",
      "dates": "Fechas",
      "delivery_date": "Fecha Entrega",
      "descrip": "Descripción",
      "example": "Ejemplo: Matemáticas I",
      "hmwrks": "Tareas",
      "info_new_course": "Cambia la información para el nuevo curso.",
      "init_date": "Fecha de inicio",
      "name": "Nombre del",
      "privacy": "Privacidad",
      "private": "Privado",
      "public": "Público",
      "publish_date": "Fecha de publicación"
    },
    "closure": {
      "closure_members": {
        "final_scores": "Calificaciones finales",
        "invite": "Invita a tus alumnos que se unan a tu curso.",
        "members": "Miembros",
        "no_members": "No hay miembros en el curso.",
        "no_score": "Sin calificar",
        "score": "Calificación:",
        "send_scores": "Envia la calificación final a los estudiantes del grupo."
      },
      "user_closure_overview": {
        "calif": "Calificación:",
        "criterium": "Criterio",
        "discuss": "Discusiones",
        "example8": "Ejemplo: 8",
        "final_score": "Calificación Final",
        "hmwrk": "Tareas",
        "members": "Miembros",
        "no_rate": "Sin calificar",
        "of": "de",
        "participate": "Participo en",
        "percent": "Porcentaje:",
        "quest": "Cuestionarios",
        "rate_student": "Calificar alumno",
        "respond": "Contesto",
        "score": "Calificación Obtenida",
        "send": "Entrego"
      }
    },
    "courses_search": {
      "courses_search": "Buscar curso...",
      "search": "Buscar"
    },
    "dashboard_deliver": {
      "access": "Acceso rápido de administración de cursos",
      "activate": "activar curso",
      "calif": "Calificaciones",
      "count_test": "Contador de examenes respondidos",
      "desactivate": "Desactivar",
      "hmwrks_course": "Tareas en el curso",
      "inactive": "Inactivo",
      "monitor": "Monitor de actividades"
    },
    "edit": {
      "edit": "Editar curso"
    },
    "edit_delivery_access": {
      "courses": "Cursos",
      "delivery_day": "Ultimo día de entrega",
      "descrip": "Descripción",
      "hmwrk_title": "Titulo de la tarea",
      "publish": "Publicar",
      "publish_date": "Día de pubicación"
    },
    "evaluation": {
      "calif": "Calificación",
      "course_score": "Calificación del curso",
      "deliver": "Entrega",
      "eval": "% de la Evaluación",
      "exam": "Examen",
      "final": "% Final",
      "hmwrk": "Tarea",
      "items": "Rubros",
      "no_deliver": "Sin entregar",
      "no_group": "No eres parte del grupo!",
      "no_member": "No has sido aceptado en el grupo!",
      "obtained": "Obtenido",
      "pdf": "Descargar (PDF)",
      "percent_obtain": "% obtenido",
      "percent_obtain1": "% Obtenido",
      "score": "Calificacion",
      "student": "Alumno:",
      "total_score": "Calificación Total",
      "unresolved": "Sin resolver"
    },
    "evaluation_download": {
      "calif": "Calificación",
      "deliver": "Entrega",
      "eval": "de la Evaluación",
      "eval_percent": "de la Evaluación",
      "exam": "Examen",
      "final": "Final",
      "hmwrk": "Tarea",
      "no_accept": "No has sido aceptado en el grupo!",
      "no_part": "No eres parte del grupo!",
      "not_resolved": "Sin resolver",
      "obtain_percent": "Obtenido",
      "obtain_percent2": "obtenido",
      "ruber": "Rubros",
      "student": "Alumno",
      "total_score": "Calificación Total",
      "undelivered": "Sin entregar"
    },
    "evaluation_schema": {
      "add_criterium": "Agregar criterio de evaluación",
      "cancel": "Cancelar",
      "criterium": "Criterio",
      "percent": "Porcentaje",
      "save": "Guardar",
      "text1": "Especifica como quieres evaluar este curso, puedes agregar nuevos criterios de evaluación o solo dejar los criterios de Cúrsame."
    },
    "form": {
      "add_students": "Inscribe estudiantes a tu curso.",
      "confirm": "¿Esta seguro que desea eliminar este curso?",
      "create": "Crear",
      "delete": "Eliminar curso permanente.",
      "descrip": "Descripción del",
      "descrip2": "Descripción",
      "example": "Ejemplo: Matemáticas I",
      "find_students": "Busca estudiantes para unirlos automaticamente al curso.",
      "first_name": "Escribe un nombre o apellido.",
      "init_date": "Fecha de inicio",
      "name": "Nombre del",
      "privacy": "Privacidad",
      "private": "Privado",
      "public": "Público",
      "save": "Guardar cambios",
      "students": "Estudiantes",
      "teachers": "Profesor"
    },
    "form_course": {
      "descrip": "Descripción",
      "init_date": "Fecha inicio",
      "name": "Nombre del",
      "privacy": "Privacidad",
      "private": "Privado",
      "public": "Público",
      "return": "Regresar al",
      "update": "Actualizar"
    },
    "index": {
      "student_courses_index": {
        "no_courses": "No hay cursos.",
        "no_show": "No hay más cursos para mostrar."
      },
      "student_header": {
        "course": "Cursando",
        "courses": "Cursos",
        "regist": "Inscríbete",
        "request": "Solicitudes"
      },
      "teacher_courses_index": {
        "no_courses": "No hay cursos.",
        "no_show": "No hay más cursos para mostrar."
      },
      "teacher_header": {
        "active": "Activos",
        "courses": "Cursos",
        "create_course": "Crear curso nuevo",
        "finalize": "Finalizados",
        "new": "Nuevo"
      }
    },
    "library": {
      "biblio": "Biblioteca",
      "file": "Archivo",
      "files": "Archivos",
      "load": "Cargar más archivos",
      "no_files": "Este curso no tiene archivos en su librería.",
      "text2": "Cúrsame no se hace responsable del contenido subido por los usuarios, ni de cualquier infracción a derechos de autor o de marca por los mismos.  El usuario que ha subido contenido es 100% responsable de él. Cualquier problema de este tipo favor de reportarlo",
      "upload": "Subir archivo"
    },
    "light_box_dashboard_delivery": {
      "criterium": "Criterios de calificación",
      "descrip": "Descripción de entrega",
      "eval": "Seleccione un porcentaje de 1 a 100 para calificar esta tarea",
      "eval_hmwrk": "Calificar tarea",
      "files": "Archivos de la entrega",
      "hmwrk_score": "Calificación de la tarea",
      "percent": "Por favor selecciona un porcentaje de 1 a 100 para calificar esta tarea",
      "score": "Calificación",
      "student": "Alumno",
      "title": "Titulo de entrega"
    },
    "members": {
      "mem": "Miembros",
      "no_members": "Curso sin miembros.",
      "no_records": "Este curso todavia no tiene miembros en el."
    },
    "members_in_courses": {
      "course_view_call": {
        "no_courses": "No hay cursos."
      },
      "owner_partial_for_member": {
        "admin": "Administrador",
        "student": "Estudiante",
        "teacher": "Profesor"
      },
      "permissionings_edit": {
        "confirm": "¿Estás seguro de querer eliminar este usuario del curso?",
        "delete": "Eliminar",
        "delete_group": "Eliminar del grupo",
        "usr_accept": "Aceptar Usuario"
      }
    },
    "new": {
      "new_course": "Curso nuevo"
    },
    "old_course": {
      "activate": "activar curso",
      "antique": "Cursos antiguos",
      "deactivate": "desactivar curso"
    },
    "pending": {
      "pending": {
        "no_request": "No hay más solicitudes pendientes."
      }
    },
    "search": {
      "courses_search_results": {
        "no_records": "No se encontraron cursos con el criterio de busqueda.",
        "search": "Busqueda:"
      }
    },
    "shared": {
      "course_card": {
        "member": "Miembro",
        "members": "Miembros"
      },
      "course_card_actions": {
        "active": "Activar",
        "activities_score": "Calificar actividades",
        "clone": "Clonar",
        "confirm": "¿Esta seguro de querer abandonar este curso?",
        "edit": "Editar",
        "enroll": "Estás inscrito",
        "eval_form": "Forma de evaluación",
        "final_score": "Calificaciones finales",
        "finalize": "Finalizar",
        "leave": "Abandonar curso",
        "request_send": "Solicitud enviada",
        "send_request": "Enviar solicitud"
      },
      "course_card_post": {
        "new_course": "Nuevo curso público"
      },
      "course_evaluation_schema_fields": {
        "criterium": "¿Que criterio se evaluará?",
        "discuss": "Discusiones",
        "hmwrks": "Tareas",
        "percent": "Porcentaje asignado",
        "quest": "Cuestionarios"
      },
      "course_header": {
        "active": "Activar",
        "activities_score": "Calificar actividades",
        "clone": "Clonar",
        "edit": "Editar",
        "eval_form": "Forma de evaluación",
        "final": "Finalizar",
        "final_score": "Calificaciones finales",
        "info": "Información",
        "library": "Biblioteca",
        "members": "Miembros",
        "publ": "Publicaciones",
        "update": "Actualizar portada",
        "update_photo": "Actualizar foto"
      },
      "courses_paginate_button": {
        "load_more": "Cargar más..."
      }
    },
    "show": {
      "course-header": {
        "active": "Activar",
        "activities_score": "Calificar actividades",
        "clone": "Clonar",
        "edit": "Editar",
        "eval_form": "Forma de evaluación",
        "final": "Finalizar",
        "final_score": "Calificaciones finales",
        "info": "Información",
        "library": "Biblioteca",
        "members": "Miembros",
        "publ": "Publicaciones",
        "update": "Actualizar portada",
        "update_photo": "Actualizar foto"
      }
    },
    "statics": {
      "active_hmwrk": "TAREAS ACTIVAS",
      "activity": "ACTIVIDADES",
      "discuss": "DISCUSIONES",
      "generate": "Se han generado",
      "in_course": "En el curso",
      "quest": "CUESTIONARIO",
      "total": "totales"
    },
    "survey_results": {
      "back": "Atras",
      "respose": "Respuesta",
      "result": "Resultado obtenido",
      "student": "Alumno"
    },
    "unpublished_courses": {
      "no_courses": "No hay más cursos para mostrar."
    }
  },
  "courses_controller": {
    "active": "se activo correctamente.",
    "clone_correct": "Curso clonado correctamente.",
    "contact": "ha finalizado, contacta al profesor para más información.",
    "create": "Se ha creado correctamente tu curso, edita tu forma de evaluación.",
    "delete": "Curso eliminado correctamente.",
    "ended": "se finalizo correctamente.",
    "has_ended": "ha finalizado, lo puedes activar en el menu de opciones del curso.",
    "no_accepted": "No has sido aceptado en este curso.",
    "no_access": "El curso al que intentas accesar, no existe o ha sido borrado.",
    "no_authorized": "Usted no está autorizado para editar este curso.",
    "no_exist": "El curso que intentas ver no existe o ha sido borrado",
    "save": "Se han guardado satisfactoriamente los cambios en el curso. ",
    "search": "Escribe algo en el campo de busqueda.",
    "success": "Se ha creado correctamente",
    "the_course": "El curso",
    "your_course": "Tu curso"
  },
  "date": {
    "abbr_day_names": [
      "dom",
      "lun",
      "mar",
      "mié",
      "jue",
      "vie",
      "sáb"
    ],
    "abbr_month_names": [
      null,
      "ene",
      "feb",
      "mar",
      "abr",
      "may",
      "jun",
      "jul",
      "ago",
      "sep",
      "oct",
      "nov",
      "dic"
    ],
    "day_names": [
      "domingo",
      "lunes",
      "martes",
      "miércoles",
      "jueves",
      "viernes",
      "sábado"
    ],
    "formats": {
      "default": "%d/%m/%Y",
      "long": "%A, %d de %B de %Y",
      "short": "%d de %b"
    },
    "month_names": [
      null,
      "enero",
      "febrero",
      "marzo",
      "abril",
      "mayo",
      "junio",
      "julio",
      "agosto",
      "septiembre",
      "octubre",
      "noviembre",
      "diciembre"
    ],
    "order": [
      "day",
      "month",
      "year"
    ]
  },
  "datetime": {
    "distance_in_words": {
      "about_x_hours": {
        "one": "cerca de 1 hora",
        "other": "cerca de %{count} horas"
      },
      "about_x_months": {
        "one": "cerca de 1 mes",
        "other": "cerca de %{count} meses"
      },
      "about_x_years": {
        "one": "cerca de 1 año",
        "other": "cerca de %{count} años"
      },
      "almost_x_years": {
        "one": "casi 1 año",
        "other": "casi %{count} años"
      },
      "half_a_minute": "medio minuto",
      "less_than_x_minutes": {
        "one": "menos de 1 minuto",
        "other": "menos de %{count} minutos"
      },
      "less_than_x_seconds": {
        "one": "menos de 1 segundo",
        "other": "menos de %{count} segundos"
      },
      "over_x_years": {
        "one": "más de 1 año",
        "other": "más de %{count} años"
      },
      "x_days": {
        "one": "1 día",
        "other": "%{count} días"
      },
      "x_minutes": {
        "one": "1 minuto",
        "other": "%{count} minutos"
      },
      "x_months": {
        "one": "1 mes",
        "other": "%{count} meses"
      },
      "x_seconds": {
        "one": "1 segundo",
        "other": "%{count} segundos"
      }
    },
    "prompts": {
      "day": "Día",
      "hour": "Hora",
      "minute": "Minuto",
      "month": "Mes",
      "second": "Segundos",
      "year": "Año"
    }
  },
  "deliveries": {
    "deliveries_course": {
      "hmwrks": "Tareas para entregar en 3 días o más",
      "hmwrks_last": "tareas pasadas en la sección Pasadas",
      "no_deliver": "Has entregado todas las tareas, puedes ver las",
      "no_hmwrks": "No tienes tareas pendientes por entregar en este curso.",
      "today_hmwrk": "Tareas para entregar Hoy",
      "tomorrow_hmwrks": "Tareas para entregar Mañana"
    },
    "deliveries_courses_lapsed": {
      "last_hmwrks": "No se encontraron más tareas pasadas."
    },
    "delivery_compart_form": {
      "add_criterium": "Agregar criterio",
      "cancel": "Cancelar",
      "courses": "Cursos",
      "criterium": "Criterios a evaluar",
      "dates": "Fechas",
      "deliver_date": "Fecha de entrega",
      "descrip": "Descripción",
      "example": "Ejemplo: Números primos",
      "hmwrk_theme": "Tema de la tarea",
      "integrity": "Por integridad de la actividad no se permiten modificar los archivos, contenidos y criterios después de ser creada le pedimos de la manera mas atenta si necesita agregar alguno de estos elimine la actividad y vuelva a cargarla.",
      "publish": "Publicar",
      "publish_date": "Día de publicación",
      "save": "Guardar Tarea",
      "support": "Material de soporte"
    },
    "index": {
      "deliver_hmwrks": "Tareas para entregar en 3 días o más",
      "hmwrks": "Tareas para entregar Hoy",
      "no_deliver": "Has entregado todas las tareas, puedes ver las",
      "no_hmwrks": "No tienes tarean pendientes por entregar.",
      "past_hmwrks": "tareas pasadas en la sección Pasadas",
      "tomorrow_hmwrks": "Tareas para entregar Mañana"
    },
    "lapsed": {
      "no_hmwrks": "No se encontraron más tareas pasadas."
    },
    "shared": {
      "deliveries_course_header": {
        "active": "Activas",
        "hmwrks": "Tareas",
        "last": "Pasadas"
      },
      "deliveries_filter_course": {
        "filter": "Filtrar: ",
        "select": "Selecciona un curso"
      },
      "deliveries_header": {
        "deliver": "Entregar",
        "hmwrks": "Tareas",
        "past": "Pasadas"
      },
      "deliveries_paginate_button": {
        "load": "Cargar más..."
      },
      "delivery_card": {
        "edit_hmwrk": "Editar Tarea",
        "hmwrk": "Ver Tarea"
      },
      "delivery_modal": {
        "deliver": "Entregar antes del",
        "deliver_hmwrk": "Entregar Tarea",
        "edit": "Editar Entrega",
        "final_score": "Calificación final obtenida",
        "hmwrk": "Tarea en el curso",
        "rubre": "Rubro sin comentarios"
      }
    }
  },
  "deliveries_controller": {
    "access_denied": "Estas tratando de ver Tareas de un curso donde no has sido aceptado.",
    "register": "Estas tratando de ver Tareas de un curso donde no estas inscrito."
  },
  "devise": {
    "confirmations": {
      "new": {
        "email": "Correo electrónico",
        "email_field": "Por favor, ingresa tu correo en el campo de abajo para dar seguimiento a tu solicitud",
        "forward": "Reenviar instrucciones",
        "no_confirmation": "No has recibido confirmación"
      }
    },
    "mailer": {
      "confirmation_instructions": {
        "push_here": "Si el boton superior no funciona, haz clic aquí",
        "usage": "Para poder utilizar tu cuenta necesitamos que confirmes tu correo electrónico, es muy sencillo: haz click en el siguiente botón y estarás listo para utilizar tu nueva plataforma de estudio.",
        "welcome": "¡Bienvenido a Cúrsame!"
      },
      "reset_password_instructions": {
        "button": "Si el boton superior no funciona, haz clic aquí",
        "pwd": "En caso que no hayas solicitado la restauración de tu contraseña por favor comunicalo a",
        "reset_password": "Nos has indicado que deseas restaurar tu contraseña, para hacerlo solo debes dar click en el botón inferior y seguir las instrucciones.",
        "reset_pwd": "Restaurar contraseña"
      },
      "unlock_instructions": {
        "button": "Si el boton superior no funciona, haz clic aquí",
        "hello": "¡Hola!"
      }
    },
    "passwords": {
      "edit": {
        "ch_pwd": "Cambiar contraseña",
        "change_pwd": "Cambia tu contraseña",
        "confirm_pwd": "Confirmar contraseña",
        "new_pwd": "Nueva contraseña"
      },
      "new": {
        "email": "Ingresa el correo electrónico con el cual te diste de alta y presiona el botón de \"reactivar contraseña\".",
        "email_field": "Correo electrónico",
        "recover_pwd": "Recupera tu contraseña",
        "res_pwd": "Recuperar contraseña"
      }
    },
    "registrations": {
      "edit": {
        "back": "Regresar",
        "cancel_acount": "Cancela tu cuenta",
        "down": "¿Quieres darte de baja?",
        "edit_usr": "Editar Usuario",
        "pwd": "Contraseña",
        "update": "Actualizar"
      },
      "new": {
        "accept": "Acepto los términos y condiciones",
        "access": "Lo sentimos pero la red a la que estas intentado accesar no existe",
        "confirm_pwd": "Confirmacion de contraseña",
        "email": "Correo electrónico",
        "last_name": "Apellidos",
        "name": "Nombre(s)",
        "no_blocked": "¿No recibiste las instrucciones de desbloqueo?",
        "no_confirmation": "¿No recibiste las instrucciones de confirmación?",
        "pwd": "Contraseña",
        "question": "pregunta a un encargado de tu escuela él sabrá ayudarte.",
        "registry": "Registrarme",
        "sign_in": "¿Ya eres usuario? Ingresa",
        "thnx": "¡Gracias!"
      }
    },
    "sessions": {
      "new": {
        "account_window": "te enviará a una pantalla que te pedirá tu email para que te volvamos a enviar los datos de confirmación.",
        "acount": "Confirma tu cuenta",
        "antique_usr": "Soy un usuario antiguo y tengo dudas",
        "change_pwd": "te pedirá que cambies tu contraseña.",
        "close": "Cerrar",
        "confirm": "Esperando confirmación",
        "confirm2": "No me ha llegado el mail de confirmación",
        "confirm3": "Confirmé mi email pero olvide cambiar mi contraseña",
        "email": "Correo electrónico",
        "forgot_pwd": "Olvidé mi contraseña",
        "init": "Ir al inicio",
        "key": "¿Mi clave sigue siendo la misma?",
        "last_user": "Si eras usuario en la plataforma anterior aún sigues siendo usuario en Cúrsame.",
        "link": "Da click en el link",
        "log_in": "Iniciar Sesión",
        "net": "La red a la que estas intentado accesar no existe",
        "net2": "pregunta a un encargado de tu escuela él sabrá ayudarte.",
        "new_pwd": "Se han generado nuevas contraseñas cuando confirmes tu correo electrónico con el mail que enviamos",
        "pwd": "Contraseña",
        "pwd_problem": "Cualquier problema con la contraseña puedes resolverlo dando click en",
        "remember": "Recordarme",
        "s_net": "Clases, Actividades, Red Social.",
        "s_net2": "Cúrsame conecta a directivos, profesores y alumnos",
        "s_net3": "permitiéndoles interactuar social y académicamente.",
        "s_netn": "Cúrsame conecta a directivos, profesores y alumnos permitiéndoles interactuar social y académicamente",
        "send": "Se ha enviado un correo a",
        "send_pwd": "donde se te enviará un mail para que puedas cambiar tu contraseña.",
        "session": "Inicia sesión",
        "sign_in": "¿Eres nuevo? Regístrate",
        "sorry": "Lo sentimos",
        "user": "¿Soy usuario?"
      }
    },
    "shared": {
      "footer-links": {
        "help": "Centro de ayuda",
        "privacy": "Aviso de privacidad",
        "terms": "Términos y Condiciones"
      },
      "links": {
        "blocked": "¿No recibiste las instrucciones de desbloqueo?",
        "confirm": "¿No recibiste las instrucciones de confirmación?",
        "log_in": "¿Ya eres usuario? Ingresa",
        "pwd": "¿Olvidaste tu contraseña?",
        "sign_in": "¿No estas registrado? Registrate"
      }
    },
    "unlocks": {
      "new": {
        "email": "Correo electrónico",
        "email_req": "Ingresa tu correo en el campo inferior para dar seguimiento a tu solicitud",
        "forward": "Reenviar instrucciones",
        "instruc": "No has recibido instrucciones de desbloqueo"
      }
    }
  },
  "discussions": {
    "correct_edit": "Discusión editada correctamente",
    "create_discuss": "Discusión creada correctamente",
    "discussions_course": {
      "no_discuss": "No se encontraron más discusiones."
    },
    "form_for_discussion": {
      "add_comment": "Agregar criterio",
      "calif": "Calificable",
      "cancel": "Cancelar",
      "create_discuss": "Crear Discusión",
      "criterium": "Criterios a evaluar",
      "dates": "Fechas",
      "deliver_date": "Fecha de entrega",
      "descrip": "Descripción",
      "discuss": "Tema de la discusión",
      "example": "Ejemplo: Números primos",
      "public": "Público",
      "publish_date": "Día de publicación",
      "save_discuss": "Guardar discusión",
      "support": "Material de soporte"
    },
    "index": {
      "no_discuss": "No se encontraron más discusiones."
    },
    "shared": {
      "discussion_card": {
        "edit_discuss": "Editar Discusión",
        "view_discuss": "Ver Discusión"
      },
      "discussion_modal": {
        "criterium": "Criterios a evaluar",
        "grade": "Calificación Obtenida",
        "in_course": "en el curso",
        "init_discuss": "ha inicidado una discusión"
      },
      "discussions_course_header": {
        "discuss": "Discusiones"
      },
      "discussions_filter_course": {
        "filter": "Filtrar:",
        "select": "Selecciona un curso"
      },
      "discussions_header": {
        "discuss": "Discusiones"
      },
      "discussions_paginate_button": {
        "load": "Cargar más..."
      }
    }
  },
  "discussions_controller": {
    "delete": "La discusión que intentas ver no existe o ah sido borrada.",
    "no_accepted": "Estas tratando de ver Discusiones de un curso donde no has sido aceptado.",
    "no_discussion": "No se pudo crear la discusión.",
    "no_register": "Estas tratando de ver Discusiones de un curso donde no estas inscrito."
  },
  "errors": {
    "format": "%{attribute} %{message}",
    "messages": {
      "accepted": "debe ser aceptado",
      "blank": "no puede estar en blanco",
      "confirmation": "no coincide con la confirmación",
      "empty": "no puede estar vacío",
      "equal_to": "debe ser igual a %{count}",
      "even": "debe ser un número par",
      "exclusion": "está reservado",
      "extension_white_list_error": "No puedes subir este tipo de archivo",
      "greater_than": "debe ser mayor que %{count}",
      "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
      "inclusion": "no está incluído en la lista",
      "invalid": "es inválido",
      "less_than": "debe ser menor que %{count}",
      "less_than_or_equal_to": "debe ser menor o igual que %{count}",
      "not_a_number": "no es un número",
      "not_an_integer": "debe ser un entero",
      "not_found": " no encontrado.",
      "odd": "debe ser un número non",
      "record_invalid": "La validación falló: %{errors}",
      "taken": "ya ha sido tomado",
      "too_long": {
        "one": "es demasiado largo (máximo 1 caracter)",
        "other": "es demasiado largo (máximo %{count} caracteres)"
      },
      "too_short": {
        "one": "es demasiado corto (mínimo 1 caracter)",
        "other": "es demasiado corto (mínimo %{count} caracteres)"
      },
      "wrong_length": {
        "one": "longitud errónea (debe ser de 1 caracter)",
        "other": "longitud errónea (debe ser de %{count} caracteres)"
      }
    },
    "template": {
      "body": "Revise que los siguientes campos sean válidos:",
      "header": {
        "one": "%{model} no pudo guardarse debido a 1 error",
        "other": "%{model} no pudo guardarse debido a %{count} errores"
      }
    }
  },
  "evaluate": {
    "course": {
      "activity": "Actividades para calificar hoy",
      "activity_for_days": "Actividades para calificar en 3 dias o más",
      "activity_for_tmrw": "Actividades para calificar mañana",
      "all": "Todas las actividades de tu curso estan calificadas, puedes ver",
      "no_activity": "No tienes actividades por calificar.",
      "past_activity": "actividades pasas en la seccion de Pasadas"
    },
    "course_inactive": {
      "enrollment": "Necesitas estar inscrito en al menos un curso para tener calificaiones.",
      "no_score": "Aún no tienes calificaciones."
    },
    "deliveries": {
      "delivery_user_response": {
        "attachments": "Archivos adjuntos",
        "check_hmwrk": "Calificar tarea",
        "comments": "Envia comentarios en base a los criterios de la actividad.",
        "deliver": "Entrega",
        "deliveries": "Entregas",
        "delivery": "Entregado",
        "example": "Ejemplo",
        "feedback": "Retroalimentación",
        "message": "Mensaje",
        "no_score": "Sin Calificar",
        "score": "Calificación:",
        "scored": "Calificar",
        "student": "Alumno",
        "title": "Titulo"
      },
      "evaluate_deliveries": {
        "deliveries": "Entregas",
        "no_deliveries": "Sin Entregas.",
        "no_deliveries_record": "Todavia no hay ninguna entrega en esta tarea.",
        "no_score": "Sin calificar",
        "score": "Calificación:"
      }
    },
    "discussions": {
      "discussion_user_response": {
        "comments": "Comentarios",
        "example": "Ejemplo",
        "feedback": "Retroalimentación",
        "no_score": "Sin Calificar",
        "rate_student": "Calificar alumno",
        "score": "Calificación",
        "send": "Envia comentarios en base a los criterios de la actividad."
      },
      "evaluate_discussions": {
        "comment": "Comentario",
        "comments": "Comentarios",
        "discuss": "Discusión",
        "nothing": "Nadie a participado en esta discusión."
      },
      "evaluate_discussions_header": {
        "course": "Curso",
        "limit_publish_date": "Fecha limite para participar",
        "members": "Participantes",
        "publish_date": "Fecha de publicación"
      }
    },
    "inactive": {
      "no_act": "No has creado ninguna actividad.",
      "no_activity": "No tienes actividades pasadas."
    },
    "index": {
      "all": "Todas las actividades de tu curso están calificadas, puedes ver",
      "no_score": "No tienes actividades por calificar.",
      "past": "actividades pasadas en la sección de Pasadas",
      "someday": "Actividades para calificar en 3 días o más",
      "today": "Actividades para calificar hoy",
      "tomorrow": "Actividades para calificar mañana"
    },
    "shared": {
      "delivery_activity": {
        "delivery": "Entregas",
        "of": "de"
      },
      "discussion_activity": {
        "members": "Participantes",
        "of": "de"
      },
      "discussions_sidebar_responses": {
        "members": "Participantes",
        "no_score": "Sin Calificar"
      },
      "evaluate_course_filter": {
        "all": "Todos los cursos"
      },
      "evaluation_criterium_feedback": {
        "feedback": "Retroalimentación"
      },
      "header_activity_delivery": {
        "course": "Curso",
        "delivery": "Entregas",
        "publish_date": "Fecha de publicación",
        "publish_date_of": "Fecha para entrega"
      },
      "header_activity_survey": {
        "answered": "Contestados",
        "attemps": "Ver los intentos",
        "course": "Curso",
        "deliver_date": "Fecha para entrega",
        "of": "de",
        "publish_date": "Fecha de publicación",
        "the": "del"
      },
      "header_evaluate": {
        "active": "Activas",
        "evaluate": "Calificar Actividades",
        "past": "Pasadas"
      },
      "survey_activity": {
        "answered": "Contestados"
      }
    },
    "survey_attemps": {
      "attemps": "Registro de intentos",
      "new_attemp": "Generar nuevo intento",
      "new_attemp_notice": "Al agregar este intento eliminaras la calificación anterior del cuestionario."
    },
    "surveys": {
      "evaluate_surveys": {
        "delivery": "Entregas",
        "no_answer": "Todavia ningún alumno ha contestado este cuestionario.",
        "no_deliveries": "Sin Entregas.",
        "obtain": "Obtenido"
      },
      "survey_user_response": {
        "answers": "Respuestas",
        "comments": "Envia comentarios al alumno.",
        "delivery": "Entregas",
        "feedback": "Retroalimentación",
        "obtain": "Obtenido",
        "reply": "Respuesta",
        "send": "Enviar comentario"
      }
    }
  },
  "evaluate_controller": {
    "correct": "Calificación asignada correctamente.",
    "error": "Ha ocurrido un error al calificar la discusión.",
    "no_activity": "Estas tratando de ver una actividad que no te pertenece.",
    "no_calificable": "La discusión que intentas ver no es calificable.",
    "no_evaluate": "Estas tratando de calificar un curso que no te pertenece.",
    "no_exist": "La discusión que intentas ver no existe o ah sido borrada.",
    "only_teachers": "Estas intentando entrar en una sección solo para profesores.",
    "send_comment": "Comentario enviado correctamente."
  },
  "evaluation_criteria": {
    "form": {
      "eval": "¿Que criterio se evaluará?"
    },
    "form_course": {
      "eval": "¿Qué se va evaluar?"
    }
  },
  "formtastic": {
    "cancel": "Cancelar",
    "create": "Guardar %{model}",
    "false": "No",
    "required": "requerido",
    "reset": "Restablecer %{model}",
    "submit": "Aceptar",
    "true": "Sí",
    "update": "Guardar %{model}"
  },
  "friendships": {
    "new_friendship": "Has agregado un nuevo amigo",
    "send_friendship": "Se ha enviado una solicitud de amistad"
  },
  "friendships_controller": {
    "delete_usr": "Se ha eliminado al usuario de tus amigos",
    "error_usr": "Error al eliminar al usuario de tus amigos"
  },
  "google_forms": {
    "shared": {
      "card": {
        "edit_form": "Editar Formulario",
        "view_form": "Ver Formulario"
      },
      "dropdown": {
        "courses": "Cursos",
        "create_course": "Crear curso",
        "dropdown_v": {
          "no_course": "No has creado ningún curso"
        },
        "public": "Público",
        "return": "Regresar"
      },
      "form": {
        "cancel": "Cancelar",
        "dates": "Fechas:",
        "deliver_day": "Fecha de entrega",
        "descrip": "Descripción: ",
        "form_descrip": "Descripción del formulario",
        "form_url": "URL del formulario",
        "public": "Público",
        "publish": "Publicar",
        "publish_date": "Día de publicación",
        "roles": "Roles: ",
        "title": "Título: ",
        "title2": "Titulo del formulario"
      },
      "google_form_modal": {
        "in_the_course": " en el curso",
        "the_form": "El formulario ",
        "was_created": " fue creado por"
      }
    },
    "success_form": "Formulario creado exitosamente"
  },
  "groups": {
    "edit": {
      "name": "Nombre",
      "update": "Actualizar"
    },
    "new": {
      "create": "Crear",
      "name": "Nombre"
    }
  },
  "helpers": {
    "select": {
      "prompt": "Por favor selecciona"
    },
    "submit": {
      "create": "Crear %{model}",
      "helpers": null,
      "submit": "Guardar %{model}",
      "update": "Actualizar %{model}"
    }
  },
  "home": {
    "about_us": {
      "about_title": {
        "text1": "Cúrsame es una plataforma educativa  fundada en México a finales de 2011 por un grupo de estudiantes de diversas universidades del país con el objetivo de mejorar la calidad educativa y reducir la brecha digital a través de la tecnología. Durante este periodo hemos logrado beneficiar a más de 100 mil estudiantes, profesores y directivos tanto de escuelas públicas como privadas en México, con visión de impactar en toda la región y demás países emergentes.",
        "text2": "Hemos recibido 3 rondas de inversión privada por parte de reconocidos fondos, también nos han otorgado una gran cantidad de premios y reconocimientos pero más importante aún, hemos logrado vincularnos con autoridades gubernamentales en proyectos de alto impacto que nos han permitido crecer de una manera bastante acelerada e impactar socialmente.",
        "title": "Acerca de Nosotros"
      },
      "description1_mission": "Mejorar la calidad de la educación en México a través  de una herramienta tecnológica  eficiente que permita  a la comunidad educativa redefinir estrategias de mejora en los procesos de enseñanza-aprendizaje en las que se complementen y favorezcan las dinámicas del aula y puedan ampliarse fuera de la escuela.",
      "description1_objetives": "Contribuir a lograr mejores resultados en el aprendizaje de los alumnos y en la inclusión digital de maestros, alumnos y miembros de su familia en México.",
      "description1_philosophy": "En Cúrsame partimos de la concepción de que el aprendizaje  no sólo es construido dentro y por la propia persona, sino que  tiene que ver con aspectos más sociales dentro de comunidades de enseñanza.",
      "description2_mission": "Democratizar el acceso a tecnología educativa de calidad y generar un cambio en la vida diaria y profesional de alumnos y profesores al acercarlos a la tecnología y sus beneficios.",
      "description2_objetives": "Promover intercambios de conocimiento  en comunidades de aprendizaje a través de la diversificación de canales de comunicación que facilitan el flujo de información desde el enfoque por competencias.",
      "description2_philosophy": "Para nosotros la posibilidad de interactuar con otros con un fin educativo a través de herramientas tecnológicas es una forma muy eficaz de favorecer los espacios de encuentro efectivo y positivo en el proceso de enseñanza-aprendizaje.",
      "description3_objetives": "Mejorar los tiempos efectivos de clase haciendo más eficiente la gestión  y el seguimiento de actividades educativas.",
      "description4_objetives": "Permitir el acceso a educación de calidad y tecnología educativa a todos las instituciones educativas, sus profesores y alumnos sin importar su situación económica y social.",
      "description_vision": "Ser una plataforma líder en el ámbito educativo que  permita a la población mexicana insertarse con éxito en la sociedad de la información y el conocimiento.",
      "mission": "Misión:",
      "objectives": "Objetivos:",
      "our_team": {
        "description": "Cúrsame está conformado por un grupo apasionado de emprendedores, tenemos como meta común generar un impacto positivo en la sociedad a través de la educación y la tecnología.",
        "title": "Nuestro equipo"
      },
      "philosophy": "Filosofía:",
      "vision": "Visión:"
    },
    "apps": {
      "text1": "Descarga nuestras Apps",
      "text2": "No te pierdas ninguna de tus actividades escolares.",
      "text3": "Próximamente"
    },
    "chat": {
      "add_friends": "Agrega a tus amigos en la sección de",
      "community": "Comunidad",
      "courses": "Cursos",
      "create": "Crear curso ahora →",
      "cursos": "Cursos",
      "friends": "Amigos",
      "no_create": "No has creado ningún curso todavia.",
      "no_friends": "No tienes amigos.",
      "no_member": "No eres miembro de ningún curso.",
      "offline_usr": "Usuario desconectado",
      "online_usr": "Usuario conectado",
      "section": "Únete a uno en la sección de"
    },
    "contact": {
      "contact_page": {
        "text1": "Llena el siguiente formulario y nos pondremos en contacto contigo en menos de 48 horas.",
        "text2": "Campos con asterisco",
        "text3": "son requeridos."
      },
      "contact_title": {
        "description": "¿Tienes alguna sugerencia, te gustaría unirte a nuestro equipo o simplemente quieres decir hola? Nos encantaría escucharte.",
        "title": "Contáctanos"
      }
    },
    "delete_publication": "Se ha borrado correctamente la publicación.",
    "demo": "Solictud de demo",
    "edit_comment": "Comentario editado correctamente.",
    "features": {
      "features_content": {
        "characteristic_chat": "Algunas de sus características son:",
        "characteristic_comment": "Algunas de sus características son:",
        "characteristic_discussion": "Algunas de sus características son:",
        "characteristic_homework": "Algunas de sus características son:",
        "characteristic_network": "Algunas de sus características son:",
        "characteristic_result": "Algunas de sus características son:",
        "characteristic_statisdic": "Algunas de sus características son:",
        "characteristic_survey": "Algunas de sus características son:",
        "chat": "Chat",
        "comments": "Comentarios",
        "description_chat": "Cada usuario puede utilizar un canal de chat con sus amigos y compañeros. Además cada curso tiene una sala de chat grupal para compartir contenido en tiempo real.",
        "description_comment": "Permite a todos los miembros de la comunidad comentarse de manera pública, grupal o personal para de esta forma interactuar social o académicamente.",
        "description_discussion": "Los usuarios pueden crear foros de discusión con contenido recomendado y promover la participación de toda la comunidad en el aprendizaje.",
        "description_homework": "Permite a los profesores crear actividades académicas y a los estudiantes responderlas desde cualquier lugar sin necesidad de utilizar papel y aumentando la productividad de ambos.",
        "description_network": "Todos los usuarios tienen un perfil y pueden ver e interactuar con los de sus amigos promoviendo la interacción social dentro de la institución.",
        "description_result": "Cada usuario puede ver su avance educativo. Los profesores visualizan los resultados de todos sus alumnos de una manera muy sencilla y en tiempo real.",
        "description_statisdic": "Los administradores de la institución tienen acceso a un panel de estadísticas que les permite conocer lo que está sucediendo dentro del plantel y con esto tomar decisiones importantes con conocimiento de causa.",
        "description_survey": "A través de los cuestionarios los profesores pueden evaluar a sus alumnos de manera fácil y automática sin tener que perder tiempo calificando reactivos o desperdiciando papel al imprimir los exámenes.",
        "discussions": "Discusiones",
        "feature1_chat": "Chat individual con amigos y compañeros",
        "feature1_comment": "Públicos o privados",
        "feature1_discussion": "Públicas o privadas",
        "feature1_homework": "Creación a uno o varios cursos",
        "feature1_network": "Encontrar amigos",
        "feature1_result": "Calificaciones por curso",
        "feature1_statisdic": "Uso de las herramientas de la plataforma",
        "feature1_survey": "Creación en uno o varios cursos",
        "feature2_chat": "Salas de chat grupal por curso",
        "feature2_comment": "A uno o varios cursos",
        "feature2_discussion": "A uno o varios cursos",
        "feature2_homework": "Fecha límite y hora de entrega",
        "feature2_network": "Encontrar compañeros de clase y profesores",
        "feature2_result": "Calificaciones individuales",
        "feature2_statisdic": "Ingreso al sistema",
        "feature2_survey": "Fecha y hora límite de entrega",
        "feature3_chat": "Compartir multimedia",
        "feature3_comment": "Contenido enriquecido (multimedia)",
        "feature3_discussion": "Contenido recomendado",
        "feature3_homework": "Archivos adjuntos",
        "feature3_network": "Solicitudes de amistad",
        "feature3_result": "Calificaciones por actividad",
        "feature3_statisdic": "Calificaciones",
        "feature3_survey": "Preguntas y respuestas ilimitadas",
        "feature4_chat": "Mensajes privados",
        "feature4_homework": "Contenido recomendado",
        "feature4_network": "Interacción en perfiles",
        "feature4_result": "Exportar a PDF",
        "feature4_statisdic": "Por curso",
        "feature4_survey": "Autoevaluación",
        "feature5_homework": "Rubros de evaluación",
        "feature5_statisdic": "Por alumno",
        "homeworks": "Tareas",
        "network": "Comunidad",
        "results": "Calificaciones",
        "statisdics": "Estadísticas:",
        "surveys": "Cuestionarios"
      },
      "features_icons": {
        "chat": "Chat",
        "comments": "Comentarios",
        "discussions": "Discusiones",
        "homeworks": "Tareas",
        "network": "Comunidad",
        "results": "Calificaciones",
        "statisdics": "Estadisticas",
        "surveys": "Cuestionarios"
      },
      "features_title": {
        "text1": "Ofrecemos herramientas, capacitación y seguimiento a instituciones educativas para mejorar la interacción en el proceso de enseñanza y aprendizaje.",
        "title1": "Metodología"
      },
      "our_methods": {
        "description_endless": "Buscamos siempre estar en contacto con nuestros usuarios para que juntos podamos mejorar la plataforma, conocer sus necesidades y enfocarnos en satisfacerlas para su mayor beneficio.",
        "description_implement": "Tenemos un equipo especializado que está dedicado a visitar los planteles para enseñar a los maestros y directivos toda la funcionalidad de la plataforma y los beneficios que esta conlleva.",
        "description_support": "En Cúrsame estamos cerca de los usuarios de la plataforma para orientarlos y auxiliarlos en caso de que sea necesario. Apoyamos con soporte vía chat, tickets y video tutoriales de uso en todo momento.",
        "description_title": "Nuestra metología toma en cuenta que una plataforma tecnológica por sí misma no es suficiente para satisfacer las necesidades de alumnos, profesores y directivos. Por esta razón trabajamos mano a mano con ellos para lograr los mejores resultados.",
        "description_training": "Antes de comenzar a usar Cúrsame capacitamos tecnológicamente a las instituciones que lo requieran. Combatimos así la Brecha Digital y apoyamos a los profesores en la adopción de las TICs.",
        "endless": "Seguimiento",
        "implement": "Implementación",
        "support": "Soporte",
        "title": "No sólo es la tecnología",
        "training": "Capacitación"
      }
    },
    "help": {
      "help2": "Ayuda",
      "videos": "Video tutoriales en linea."
    },
    "jobs": {
      "job_board": {
        "apply_for_job": "¡Aplicar para esta vacante!",
        "description1_senior_developer": "Para poder seguir ofreciendo la mejor plataforma educativa del mercado a nuestros usuarios e impactar positivamente en la calidad educativa de nuestro país, buscamos tener siempre el mejor equipo de desarrollo.",
        "description2_senior_developer": "Buscamos un perfil con experiencia en manejo de equipos de desarrollo.",
        "implementation": "Implementación",
        "offer1_senior_developer": "+ Sueldo competitivo con el mercado (a negociar).",
        "offer2_senior_developer": "+ Prestaciones de Ley.",
        "offer3_senior_developer": "+ Gran ambiente de trabajo.",
        "offer4_senior_developer": "+ Bonos conforme a resultados.",
        "offer5_senior_developer": "+ Oportunidad de trabajar en una empresa con un potencial de crecimiento enorme y de cambiar la vida de millones de personas.",
        "requeriment1_senior_developer": "+ Al menos 3 años de experiencia en desarrollo de software as a service.",
        "requeriment2_senior_developer": "+ Al menos 2 años de experiencia desarrollando en Ruby, RoR, Phyton o Meteor JS.",
        "requeriment3_senior_developer": "+ Ganas de cambiar el mundo.",
        "requeriments": "Requerimientos:",
        "responsabilities": "Responsabilidades:",
        "responsibility1_senior_developer": "+ Planeación y ejecución del Road Map de desarrollo de la plataforma y nuevos productos.",
        "responsibility2_senior_developer": "+ Establecer metodologías de trabajo ágiles para el equipo de desarrollo.",
        "responsibility3_senior_developer": "+ Organización de los roles trabajo de los miembros del equipo para cubrir las áreas de necesidad.",
        "responsibility4_senior_developer": "+ Participar en la creación de código para el back end de la plataforma.",
        "vacancies": "Vacantes",
        "we_offer": "Ofrecemos:"
      },
      "jobs_title": {
        "text1": "Estamos Transformando la Educación en México.",
        "text2": "¿Te gustaría trabajar con nosotros?",
        "title": "Empleos"
      }
    },
    "landing_page": {
      "cursame_stats": {
        "success_stories_path": "Proyectos",
        "title1": "Usuarios beneficiados",
        "title2": "Instituciones usando Cúrsame",
        "title3": "Actividades en toda la República Mexicana"
      },
      "features_showcase": {
        "features_path": "Conoce nuestra metodología",
        "text1": "Es muy fácil y rápido aprender a utilizar Cúrsame. Gracias a su diseño y funciones fomenta la adopción por parte de los usuarios.",
        "text2": "Nuestras Herramientas aumentan la productividad y reducen la carga de trabajo para profesores, alumnos y directivos.",
        "text3": "Cúrsame puede utilizarse desde cualquier computadora o dispositivo móvil, esto permite crear y consultar contenido a cualquier hora y lugar.",
        "title1": "Fácil de usar",
        "title2": "Funciones simples y poderosas",
        "title3": "Multiplataforma"
      },
      "intro_homepage_hidden": {
        "request_demo": "¡Solicita un demo en tu plantel!",
        "text1": "Cúrsame es una plataforma que conecta profesores, alumnos y directivos de una misma institución.",
        "title1": "Interactúa social y académicamente mejorando los procesos de aprendizaje y la calidad educativa"
      },
      "social_impact": {
        "description": "Buscamos generar un impacto positivo en la sociedad a través de mejorar la calidad educativa, reducir la brecha digital y detectar oportunamente los focos rojos en comunidades estudiantiles.",
        "header": "Compromiso e impacto social",
        "text1_1": "Seguimiento personalizado del avance educativo de los estudiantes.",
        "text1_2": "Con apoyo de nuestros aliados llevamos servidores y tabletas a las escuelas que más lo necesitan.",
        "text1_3": "A través de diversos indicadores apoyamos en la detección de: Riesgo de deserción escolar.",
        "text2_1": "Entrega contenido especializado de acuerdo a las necesidades individuales.",
        "text2_2": "Apoyamos a los profesores con capacitación y asesoría tecnológica.",
        "text2_3": "Consumo de sustancias.",
        "text3_1": "Aumenta la productividad y permite potenciar la enseñanza y mejorar el aprendizaje.",
        "text3_2": "La plataforma promueve el intercambio digital de contenido educativo.",
        "text3_3": "\"Bullying” escolar.",
        "title1": "Mejora la calidad educativa",
        "title2": "Reduce la brecha digital",
        "title3": "Detección oportuna de focos rojos"
      },
      "testimonials": {
        "description1": "Cúrsame ha sido una herramienta fundamental en el desarrollo y complemento del día a día en el salón de clases, aumenta el tiempo efectivo en el aula, además nos ayuda a montar programas de lectura y ahorro de papel, lo cual es un gran beneﬁcio.",
        "description2": "He utilizado un sin número de LMS’s, y Cúrsame es la plataforma educativa que mejor se ha adaptado al entorno académico real. Su facilidad de uso y factor social ha provocado que nuestros maestros lo adopten y usen en su trabajo escolar diario beneﬁciando a miles de alumnos.",
        "description3": "La mejor herramienta para la educación. En nuestra experiencia en Media Superior y Superior hemos tenido  el reto de implementar tecnología para la enseñanza sin haber tenido mucho éxito hasta que comenzamos a trabajar con Cúrsame, los resultados han sido bastante satisfactorios.",
        "header": "Testimoniales",
        "name1": "Lic. Francisco Fabián Brizuela",
        "name2": "Lic. Alejandro Caballero",
        "name3": null,
        "title1": "Director del Centro de Innovación Tecnológica Educativa Secundarias Técnicas Distrito Federal",
        "title2": "Subdirector Académico Universidad Tecnológica Emiliano Zapata",
        "title3": "Asesora en Secretaría de Educación Pública - Subsecretaría de Educación Media Superior"
      },
      "user_roles_types": {
        "description": "Pensamos y diseñamos herramientas para los maestros, alumnos, directivos y padres de familia de tu comunidad escolar.",
        "header": "Toda tu institución en un sólo lugar",
        "text1": "Toma el control de tu institución con estadísticas en tiempo real y sistemas de comunicación.",
        "text2": "Convierte tus clases en una comunidad de aprendizaje, ahorra tiempo y potencia tus capacidades de enseñanza de una forma social.",
        "text3": "Interactúa con tus compañeros y profesores. Resuelve tus dudas, aprende y haz tus entregas en cualquier hora y lugar.",
        "text4": "Mantente al día de las actividades y avances escolares de cada uno de tus hijos en tiempo real.",
        "title1": "Directivos",
        "title2": "Maestros",
        "title3": "Alumnos",
        "title4": "Padres"
      }
    },
    "like": "Me gusta",
    "load_more_notfications": {
      "load_more_notifications": "Ver más notificaciones"
    },
    "login_form": {
      "log_in": "Iniciar Sesión",
      "pwd": "Olvidé mi contraseña",
      "remember": "Recordarme"
    },
    "mkt_pages": {
      "ad01": {
        "form": "Llena el siguiente formulario y nos pondremos en contacto contigo.",
        "text1": "Las demandas profesionales de la economía global y la sociedad de la información requieren del dominio de herramientas socioculturales para interactuar con conocimientos, tales como el lenguaje y la información; al mismo tiempo requieren de las herramientas físicas, tales como las computadoras, móviles y dispositivos con interfaces cada día más complejas. Usar las herramientas de forma interactiva requiere de algo más que el simple acceso a la herramienta y la destreza técnica requerida para manejar la situación. Los alumnos también necesitan crear y adaptar el conocimiento y las destrezas.",
        "text2": "Hoy se reconoce que las tecnologías de la información y la comunicación ofrecen muchas posibilidades para apoyar los procesos de enseñanza-aprendizaje. Favorecen la motivación, el interés por la materia, la creatividad, la imaginación y los métodos de comunicación, mejoran la capacidad para resolver problemas y el trabajo en grupo, refuerzan la autoestima y permiten mayor autonomía de aprendizaje.",
        "text3": "es una plataforma educativa integral que contribuye a lograr mejores resultados en el aprendizaje de los alumnos y en la inclusión digital de maestros, alumnos y miembros de su familia.",
        "text4": "Su principal característica es que retoma aspectos de los Sistemas de Gestión de Aprendizajes (Learning Activity Management System) y de las redes sociales y los integra en una sola plataforma, facilitando los flujos de información, los intercambios de conocimiento y el trabajo colaborativo a través de comunidades de aprendizaje.",
        "tool": "Herramientas del futuro en la educación de hoy"
      },
      "mkt_thanks": {
        "agent": "Uno de nuestros agentes se comunicará contigo lo más pronto posible.",
        "thnks": "¡Gracias por contactarnos!"
      }
    },
    "new_comment": "Se ha creado un comentario",
    "not_found": {
      "not_found2": "Lo sentimos, no encontramos la ruta",
      "return": "Regresar al inicio"
    },
    "press": {
      "text1": "Prensa",
      "text2": "Lo que se dice en medios sobre Cúrsame."
    },
    "privacidad": {
      "best_product": "Mejora del producto.",
      "description1_who_are_we": "Redes Sociales de Aprendizaje SAPI de CV, mejor conocido como Cúrsame",
      "description2_who_are_we": ", con domicilio en",
      "description3_who_are_we": "calle Pomona 7, colonia Roma Norte, ciudad DF, municipio o delegación Cuauhtémoc, c.p. 06100, en la entidad de México DF, país México , y portal de internet",
      "description4_who_are_we": "es el responsable del uso y protección de sus datos personales, y al respecto le informamos lo siguiente:",
      "personal_data1": "¿Para qué fines utilizaremos sus datos personales?",
      "personal_data2": "De manera adicional, utilizaremos su información personal para las siguientes finalidades secundarias que&nbsp;",
      "personal_data3": "no son necesarias",
      "personal_data4": "&nbsp;para el servicio solicitado, pero que nos permiten y facilitan brindarle una mejor atención",
      "personal_data5": "En caso de que no desee que sus datos personales sean tratados para estos fines secundarios, desde este momento usted nos puede comunicar lo anterior a través del siguiente mecanismo",
      "personal_data6": "Para conocer mayor información sobre los términos y condiciones en que serán tratados sus datos personales, como los terceros con quienes compartimos su información personal y la forma en que podrá ejercer sus derechos ARCO, puede consultar el aviso de privacidad integral en",
      "privacy": "¿Dónde puedo consultar el aviso de privacidad integral?",
      "service": "La negativa para el uso de sus datos personales para estas finalidades no podrá ser un motivo para que le neguemos los servicios y productos que solicita o contrata con nosotros.",
      "support": "A través de nuestro soporte en línea o escribiendo a",
      "title": "AVISO DE PRIVACIDAD",
      "who_are_we": "¿Quiénes somos?"
    },
    "request_demo": {
      "text1": "Un asesor especializado visitará tu plantel para demostrar la plataforma y resolver todas tus dudas.",
      "text2": "Llena el siguiente formulario y nos pondremos en contacto contigo en menos de 48 horas.",
      "text3": "Campos con asterisco",
      "text4": "son requeridos.",
      "title": "Solicitar Demo"
    },
    "send": "¡Tu mensaje se ha enviado!",
    "server_error": {
      "conti": "Debido a una contingencia",
      "info": "no es posible mostrar esta información",
      "return": "Regresar al inicio"
    },
    "success_stories": {
      "stories_list": {
        "cobaem": "COBAEM",
        "description_cobaem": "Tras un piloto con 6 planteles del Colegio de Bachilleres de Estado de México, nos encontramos en etapa de expansión y serán 48 planteles en más de 40 municipios de la entidad y 50 mil usuarios los beneficiados por Cúrsame.",
        "description_emprendedores": "Proyecto en conjunto con la Subsecretaría de Educación Media Superior, Angel Ventures y Ashoka. A través de Cúrsame se imparte educación para emprendedores en 100 planteles de preparatoria de todo el país y actualmente en expansión para llegar a 1000 planteles en 2014.",
        "description_pilot_tablets": "Actualmente participamos en la licitación / piloto Federal que se realiza en Morelos, Guanajuato y Querétaro para educación con tabletas en primarias del país. Somos parte de dos de las 5 propuestas finalistas (IUSA y HP).",
        "description_tecnica_df": "Trabajamos con un piloto de 6 planteles tras el cual estamos en proceso de expansión con un universo de 120 planteles  en todo el Distrito Federal.",
        "emprendedores": "Modelo de Emprendedores de Educación Media Superior",
        "pilot_tablets": "Piloto Federal educación con tabletas",
        "schools": "Planteles:",
        "students": "Alumnos:",
        "teachers": "profesores:",
        "tecnica_df": "Secundarias Técnicas del DF",
        "testimonial": "Testimonio",
        "testimonial_emprendedores": "“La mejor herramienta para la educación. En nuestra experiencia en Media Superior y Superior hemos tenido  el reto de implementar tecnología para la enseñanza sin haber tenido mucho éxito hasta que comenzamos a trabajar con Cúrsame, los resultados han sido bastante satisfactorios.”",
        "testimonial_emprendedores_name": "Lic. Katia Águila",
        "testimonial_emprendedores_title": "Asesora en Secretaría de Educación Pública - Subsecretaría de Educación Media Superior",
        "testimonial_tecnica_df": "\"Cúrsame ha sido una herramienta fundamental en el desarrollo y complemento del día a día en el salón de clases, aumenta el tiempo efectivo en el aula, además nos ayuda a montar programas de lectura y ahorro de papel, lo cual es un gran beneﬁcio.\"",
        "testimonial_tecnica_df_name": "Lic. Francisco Fabián Brizuela",
        "testimonial_tecnica_df_title": "Director del Centro de Innovación Tecnológica Educativa Secundarias Técnicas Distrito Federal"
      },
      "success_stories_title": {
        "description_success_stories": "Trabajamos con una gran cantidad de instituciones educativas, aquí mostramos algunos de los casos más relevantes.",
        "success_stories": "Proyectos"
      }
    },
    "teacher_day": {
      "happy": "¡Feliz día del Maestro!",
      "text1": "En Cúrsame estamos muy orgullosos de tí y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text2": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text3": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Maestro ¡Te lo mereces!"
    },
    "terms_and_conditions": {
      "terms": "Términos y condiciones del sitio",
      "terms1": "Nuestros servicios están disponibles solamente para los individuos y las empresas del marco educativo (que incluyen pero no restringidos a estos, a las de propietario único) en correcta situación legal que puede firmar contratos legalmente obligatorios y se den derecho a suscribir y tener acceso a nuestros servicios bajo la legislación aplicable. Por lo que el cliente garantiza que está bajo la jurisdicción legal del país al que pertenece y bajo la normatividad del mismo. En consecuencia, el cliente garantiza que está autorizado para hacer negocios y está en correcta situación legal en las jurisdicciones en las cuales hace el negocio (durante el término de este acuerdo), que no es un competidor de Cúrsame, y que la persona que acepta este acuerdo tiene por lo menos dieciocho años de la edad y está capacitado y autorizado para asumir las obligaciones contractuales como cliente.",
      "terms10f": "Tipo de indemnización.",
      "terms10x": "Cúrsame solo indemnizara al usuario en especie, no en ninguna forma monetaria, solo mediante la extensión del tiempo que haya sido contratado el servicio, según el tiempo que haya fallado el mismo.",
      "terms1f": "Requerimientos para tener acceso a los Servicios de Cúrsame.",
      "terms2": "Conforme a los términos y condiciones del presente Acuerdo, Cúrsame se compromete a brindar ciertos Servicios al Cliente. Para los efectos del presente Acuerdo: (a) \"Cliente\" (o \"usted\") se refiere al individuo o a la entidad comercial que utiliza o se registró para utilizar dichos Servicios, incluyendo a sus empleados y agentes; (b) \"Servicios\" de Cúrsame se refiere a todos los servicios interactivos o electrónicos ofrecidos por Cúrsame. Cúrsame Online se reserva el derecho de modificar o interrumpir la prestación de sus Servicios en cualquier momento.",
      "terms2f": "Servicios de Cúrsame.",
      "terms3": "Reconoce que el contenido (excepto el que se carga en Cúrsame) de esta página Web, incluyendo pero no limitándose a información, documentos, productos, logotipos, elementos gráficos y sonidos, gui, software y servicios (llamados colectivamente \"Materiales\"), es provisto por Cúrsame o por sus respectivos autores, diseñadores y vendedores (llamados colectivamente \"Proveedores\") y que Cúrsame y/o sus Proveedores se reservan todos los derechos de propiedad inherentes al mismo. Los elementos de la página Web están protegidos por las leyes aplicables al secreto comercial (trade dress) y por otras leyes que no pueden copiarse ni imitarse en su totalidad o en parte. Cúrsame, el logotipo de Cúrsame y otros productos a los que se hace referencia en el presente son marcas de Cúrsame y pueden estar registradas en ciertas jurisdicciones. Cualquier otro nombre de producto, nombre de la empresa, marcas, logotipos y símbolos pueden ser las marcas comerciales de sus propietarios respectivos.",
      "terms3f": "Propiedad",
      "terms4": "El Cliente reconoce y garantiza que la información que proporciona a Cúrsame en los formularios de información de contacto es verdadera, precisa, actual y completa. El Cliente acuerda mantener y actualizar dicha información para asegurar dichas condiciones. En el caso de que dicha información fuera incorrecta, imprecisa, desactualizada o incompleta, Cúrsame tendrá el derecho de suspender o terminar la cuenta del Cliente y el presente acuerdo.",
      "terms4f": "Información del Cliente",
      "terms5": "El Cliente puede designar a personas como sus agentes para que utilicen los Servicios, siempre que cada persona designada tenga la capacidad legal para realizar acuerdos de cumplimiento obligatorio para el Cliente. Además, el Cliente representa y garantiza que cada persona que se registra con la cuenta del Cliente es un agente autorizado del Cliente (un \"Usuario Autorizado\") que tiene dicha capacidad legal.",
      "terms51": "Usuarios autorizados",
      "terms52": "Responsabilidad de Acceso",
      "terms53": "Responsabilidad por los ID y contraseñas del usuario",
      "terms53x": "El Cliente es el único responsable de mantener la confidencialidad de la información de acceso del Cliente, es decir, IDs y contraseñas de acceso a las cuentas de sus Usuarios Autorizados, y es responsable de todas las actividades que ocurren en su cuenta.",
      "terms54": "Notificación de uso no autorizado",
      "terms54x": "El Cliente debe informarle inmediatamente a Cúrsame si nota cualquier actividad que indicara que su cuenta o información está siendo usada sin autorización, incluyendo: (a) El Cliente recibe la confirmación de una o más órdenes realizadas a través de su cuenta que en realidad nunca realizó o cualquier otro informe conflictivo similar; o (b) el Cliente nota el uso no autorizado de cualquier producto o servicio relacionado con su(s) cuenta(s).",
      "terms5f": "Cuenta del Cliente (membresía de maestro Cúrsame)",
      "terms5x": "El Cliente es el único responsable del acceso y uso de los Servicios (incluyendo todas las actividades y transacciones) por parte de cualquier Usuario Autorizado y/o ID del Usuario registrado bajo la cuenta del Cliente, a menos que dicho acceso o uso de los Servicios sea resultado directo de negligencia por parte de Cúrsame. Es responsabilidad del Cliente, a través de su Usuario Autorizado que administra sus sistemas, permitir el acceso apropiado a cualquiera de los Usuarios Autorizados del Cliente.",
      "terms61f": "Circunstancias especiales",
      "terms61x": "Cúrsame permitirá el acceso a los Servicios y a la información del Cliente a cualquier agente del Cliente (\"Agente Autorizado\") que presente a Cúrsame una carta notariada firmada por un funcionario del Cliente. Dicha carta deberá incluir declaraciones de autenticidad, autorización, y responsabilidad como lo estipula Cúrsame a su sola discreción. El cliente acuerda de forma expresa e irrevocable que Cúrsame puede confiar en dicha carta y en la autorización aparente de esa persona que solicita el acceso a los Servicios o a la cuenta del Cliente. Cúrsame no será responsable ante el Cliente o cualquier tercero por la veracidad de dicha carta o autoridad.",
      "terms6f": "Información del Cliente",
      "terms6x": "El Cliente es el único responsable por la información que almacena en los servidores de Cúrsame. El Cliente controla su información a través de su enlace generado. Cúrsame recomienda a los Clientes que archiven su información de manera regular y frecuente; el Cliente tiene absoluta responsabilidad de archivar su información y será el único responsable por información perdida o irrecuperable. El Cliente acuerda cumplir con las obligaciones legales concernientes a su información. Cúrsame eliminará información del Cliente una vez finalizado el presente Acuerdo. Sin embargo, Cúrsame puede llegar a retener información del Cliente en sus archivos luego de eliminarlo y no será responsable en lo absoluto por dicha información.",
      "terms7": "Uso aceptable",
      "terms71": "Ilegalidad/ Contenido adulto",
      "terms71f": "Cúrsame sanciona y no permite el contenido del sitio o la transmisión de información que contenga material obsceno o ilegal o fomente o promueva actividad ilegal, incluyendo pero no limitándose a juegos, venta de armas ilegales, y la promoción o publicación de cualquier material que pueda violar la legislación de delitos hostiles.",
      "terms71x": "Cúrsame se reserva el derecho a suspender o rescindir inmediatamente y sin previo aviso cualquier cuenta o transmisión que viole esta política. Asimismo, si el Cliente violara esta política, Cúrsame asistirá y cooperará activamente con las agencias policiales y las autoridades gubernamentales al recolectar y ofrecer información sobre el Cliente, el sitio del Cliente, el contenido obsceno o ilegal, y de aquellas personas que puedan haber accedido, adquirido o utilizado de manera inapropiada contenido obsceno o ilícito.",
      "terms72": "Conducta ilícita",
      "terms72x": "El Cliente no cometerá o permitirá la realización de actos dañinos o ilícitos que justifiquen la acción civil, que incluya pero no se limite a la publicación de información privada, escandalosa o difamatoria acerca de una persona sin su consentimiento o que causare intencionalmente angustia emocional.",
      "terms73": "Se prohíben estrictamente las violaciones o intentos de violaciones de los sistemas de Cúrsame, o la interrupción de sus servicios. Dicha violación puede resultar en responsabilidad civil y penal. Sin limitación, los ejemplos de violaciones del sistema incluyen",
      "terms73f": "Acceso e interferencia",
      "terms73x": "Acceso sin autorización o uso de los Servicios de Cúrsame, incluyendo cualquier intento de sondeo, copia o prueba de vulnerabilidad de un sistema o la violación de medidas de seguridad o autenticación sin autorización expresa de Cúrsame; o b) Interferencia con el Servicio a cualquier cliente o sistema, incluyendo, sin limitación, congestión o intento deliberado de sobrecargar un sistema y ataques explícitos; o c) Utilización de cualquier dispositivo, software, o rutina que interfiera o intente interferir con el correcto funcionamiento de los Servicios; o d) Cualquier acción que imponga una carga desproporcionada o inmoderada para la infraestructura de Cúrsame",
      "terms73x1": "El Cliente no deberá desarmar, desmontar, decodificar, extraer, revertir la ingeniería o de otra forma intentar derivar el código fuente del \"software\" (incluyendo los dispositivos, métodos, procesos, e infraestructura) que sustentan los Servicios o cualquier otro software en el sitio Web de Cúrsame. 8.4 Violación de derecho de autor o marca registrada Los Servicios de Cúrsame se pueden utilizar únicamente con propósitos legales. Se prohíbe la transmisión, distribución o almacenamiento de cualquier material en violación a cualquier ley vigente o regulación, incluyendo la exportación de leyes de control. Esto incluye, sin limitación, material protegido por patente, derecho de autor, marca registrada, marca identificada de servicios, secreto de fabricación, u otros derechos de propiedad intelectual. Si utiliza material de terceros, deberá obtener autorización previa. Al utilizar los Servicios, usted representa y garantiza ser el autor y dueño de derechos de autor y/o titular de la licencia con respecto a cualquier contenido alojado y, asimismo, representa y garantiza que ningún contenido viola la marca registrada o los derechos de terceros. Cúrsame se reserva el derecho de suspender o rescindir la(s) transmisión(es) que, a su criterio, violan estas políticas o violan alguna ley o regulación.",
      "terms75": "Mal uso de los recursos del sistema",
      "terms75f": "El Cliente no deberá hacer mal uso de los recursos, que incluyan pero que no se limiten a, empleo del contenido que consume excesivo tiempo en el CPU o espacio de almacenamiento; utilización excesiva de la banda ancha; o reventa del acceso al contenido alojado en los servidores de Cúrsame.",
      "terms76": "Otras actividades",
      "terms76f": "Ya sea lícito o ilícito, Cúrsame se reserva el derecho a determinar qué es perjudicial para sus Clientes, operaciones o reputación, incluyendo actividades que restrinjan o inhiban a algún otro usuario del uso o placer de disfrutar el Servicio o Internet.",
      "terms76x": "Por favor, sea consciente que Cúrsame se reserva el derecho de supervisar, suspender, restringir, suprimir, modificar, o terminar cualquier contenido o transmisión de la cuenta que se considere viola cualquiera de las políticas anteriormente dichas. Si se da el caso, Cúrsame formulará las denuncias pertinentes a las autoridades responsables de la aplicación de la ley, y en tal caso, Cúrsame ayudará activamente a las entidades responsables de aplicar la ley y con la investigación y el proceso de cualquier actividad, incluyendo la entrega de las cuentas de los clientes y de sus datos personales.",
      "terms76x1": "Las quejas sobre violadores de nuestra Política deben enviarse por correo electrónico a politicasvioladas@cursa.me . Se investigará cada queja y puede resultar en la inmediata cancelación de los Servicios, sin previo aviso.",
      "terms7ax": "cargar, publicar, enviar por correo electrónico, transmitir u ofrecer de otra manera cualquier Contenido que propague mensajes de terror o describa tortura o muerte; si es un caso muy serio, se informará a la autoridad legal competente y/o se contactará al correspondiente proveedor de Internet;",
      "terms7bx": "perjudicar a menores, esto incluye cualquier forma de pornografía infantil; si es un caso muy serio, se informará del contenido a la autoridad legal competente y/o se contactará al correspondiente proveedor de Internet; se prohibe publicar cualquier tipo de pornografía.",
      "terms7cx": "cargar, publicar, enviar por correo electrónico u ofrecer de otra manera cualquier Contenido que viole la patente, marca registrada, secreto de fabricación, derecho de autor u otros derechos propietarios de cualquier parte.",
      "terms7dx": "Envío masivo de correo no solicitado (\"Spam\"). Se prohíbe el envío de cualquier forma de Spam a través de los servidores de Cúrsame. Asimismo, también se prohíbe el uso de cualquier recurso de el sitio web de Cúrsame para el envío de Spam de otro proveedor de servicio, anuncio de un sitio Web, o dirección de correo. Las cuentas o los servicios de Cúrsame no pueden ser usados para solicitar información/respuestas de los clientes, mediante mensajes enviados desde otro ISP (Proveedor de Servicios de Internet) donde esos mensajes puedan violar esta política de uso o la del otro proveedor.",
      "terms7ex": "El anuncio, transmisión, o cualquier otra manera de hacer accesible, o el uso de cualquier programa, producto o servicio que esté diseñado para violar los términos y las condiciones de este acuerdo o del uso aceptable de este u otro ISP, incluyendo, aunque de forma no limitada a, facilitar los medios de envío de Spam, iniciación de operaciones de ping, avalancha, bombardeo de correo, o negación de ataques al servicio;",
      "terms7fx": "Reenvío a usuarios de Internet de cualquier sitio web que, si ese sitio web contase con soporte de Cúrsame, supondría la violación de los términos de este acuerdo;",
      "terms7gx": "proveer anonimato a actividades ilegales, fraudulentas o que violen los derechos de propiedad intelectual de una tercera parte;",
      "terms7hx": "conociendo o deliberadamente permitiendo a otros el uso de los servicios de Cúrsame: (i) para cualquier actividad ilegal, invasiva, fraudulenta, difamatoria, o con propósito fraudulento; (ii) para alterar, robar, corromper, inhabilitar, destruir, violar o penetrar en cualquier sistema de seguridad o cifrado de cualquier fichero electrónico, base de datos o red; (iii) para materialmente interferir el uso de la red de Cúrsame de otros clientes o usuarios autorizados; (iv) en violación de las políticas de uso aceptable aplicables al uso de los proveedores de servicios nucleares de Cúrsame, y considerando que usted está avisado de tales políticas o tales políticas está disponibles en lugares públicos de los sitios web de tales proveedores; o (v) de manera que, en opinión de Cúrsame, es contraria a las reglas generalmente aceptadas de etiqueta y de la buena conducta en Internet;",
      "terms7ix": "intentar obtener acceso a otra cuenta o recurso de otro ordenador de propiedad ajena sin autorización del legítimo dueño (por ejemplo \"hacking\");",
      "terms7jx": "obtener o intentar servicios por otros medios o usando dispositivos con la intención de intentar no pagar;",
      "terms7kx": "participar en actividades diseñadas para molestar o que puedan suponer la negación del servicio (por ejemplo ataques sincronizados) a otros usuarios, ya sea en la red de Cúrsame o en la de cualquier otro ISP (Proveedor de Servicios de Internet);",
      "terms7lx": "interferir con el uso o disfrute de la red Cúrsame u otros servicios por parte de otros clientes o usuarios autorizados, incluyendo el uso excesivo de los servicios impidiendo el uso equitativo por parte de otros usuarios de Cúrsame.",
      "terms7mx": "exponer a los proveedores, representantes, directivos, empleados, agentes, asociados o accionistas de Cúrsame a escrutinio público, ridículo o difamación;",
      "terms7nx": "suplantar a cualquier persona o entidad, incluyendo, aunque sin limitarse a ellos, a representantes de Cúrsame, así como falsamente afirmar o inducir a interpretaciones erróneas sobre su personalidad o afiliación a personas o entidades;",
      "terms7ox": "importar de forma paralela cualquier copia de obras con derechos de propiedad intelectual protegida con el objeto de venderla, alquilarla, etc. por provecho, recompensa y/o.",
      "terms7px": "importar o poseer cualquier importación paralela de copias de obras con derechos de propiedad intelectual protegidas, tales como, películas, series de televisión o grabaciones musicales para su reproducción o visionado público, incluyendo, aunque sin limitación, locales de karaoke, restaurantes, tiendas, etc.",
      "terms7x": "Usted acuerda no utilizar los servicios de Cúrsame para",
      "terms8": "Limitación de la responsabilidad",
      "terms8x": "Usted usa Cúrsame bajo su propia responsabilidad. Si usted no está satisfecho con cualquier aspecto de nuestro servicio o con estos términos y condiciones, o algunas otras reglas o políticas, su única solución es finalizar el uso del servicio. Usted explícitamente entiende y acepta que Cúrsame no será responsable por cualquier daño directo, daños accidentales indirectos, fortuitos, especiales, consecuentes, incluyendo pero no limitados a, los daños por la pérdida de beneficios, buena voluntad, uso, datos u otras pérdidas intangibles (incluso si le hemos advertido sobre la posibilidad de tales daños), resultando de: (a) el uso o la incapacidad para utilizar el servicio; (b) el coste de obtención mercancías o servicios alternativos resultado de cualquier mercancía, dato, información comprados o obtenidos o mensajes recibidos o transacciones realizadas en o mediante este servicio; (c) acceso desautorizado a o alteración de sus transmisiones o datos; (d) declaraciones o actuaciones de cualquier tercer parte en el servicio; o (e) cualquier otra asunto relativo al servicio.",
      "terms9f": "Limitación de la responsabilidad de protección a contenidos.",
      "terms9x": "xCúrsame no indemnizará al usuario en fallo del sistema, perdida de su información, jaqueo, destrucción de su información voluntariamente, intento de daño de otro usuario, uso de su información para daño físico, uso de su información para daño moral, uso de su información para cualquier tipo de violación a la ley. No nos hacemos responsables del uso que se le dé a sus contenidos en la red."
    },
    "thnx": "Gracias por usar Cúrsame.",
    "unlike": "Ya no me gusta",
    "wall": {
      "comment": "Comentar"
    }
  },
  "layouts": {
    "sessions": {
      "help": "Ayuda"
    },
    "static_pages": {
      "first_column": {
        "title1": "Cúrsame",
        "title10": "Blog",
        "title2": "Metodología",
        "title3": "Proyectos",
        "title4": "Nosotros",
        "title5": "Prensa",
        "title6": "Empleos",
        "title7": "Contacto",
        "title8": "Solicitar Demo",
        "title9": "Aplicaciones"
      },
      "fourth_column": {
        "title1": "Derechos reservados © 2014 Cúrsame",
        "title2": "Ver la página en ingles"
      },
      "second_column": {
        "title1": "Ayuda",
        "title2": "Centro de ayuda",
        "title3": "Aviso de Privacidad",
        "title4": "Términos y Condiciones"
      },
      "third_column": {
        "title1": "Síguenos en"
      }
    },
    "super_admin": {
      "activities": "Actividades",
      "admin": "administración",
      "admin_net": "Administrar redes",
      "course_admin": "Administrador de cursos",
      "hello": "hola",
      "statics": "Estadísticas",
      "super_adm": "Super admins",
      "usr": "Usuarios"
    }
  },
  "libraries": {
    "new": {
      "new_library": "Nueva Biblioteca"
    },
    "shared": {
      "card": {
        "view_files": "Ver Archivos"
      },
      "header": {
        "create_folder": "Crear Carpeta",
        "library": "Biblioteca",
        "upload_file": "Subir Archivo"
      },
      "library_files": {
        "no_documents": "No hay documentos."
      }
    }
  },
  "library_directories": {
    "shared": {
      "form": {
        "descrip": "Descripción: ",
        "lib_descrip": "Descripción de la biblioteca",
        "lib_name": "Titulo de la biblioteca",
        "name": "Nombre: ",
        "send": "Enviar"
      },
      "header": {
        "create_folder": "Crear Carpeta",
        "library": "Biblioteca",
        "upload_file": "Subir Archivo"
      },
      "list": {
        "no_documents": "No hay documentos."
      },
      "standalone_card": {
        "open_folder": "Abrir Carpeta"
      }
    }
  },
  "library_files": {
    "new": {
      "upload_file": "Subir Archivo"
    },
    "shared": {
      "card": {
        "download_file": "Descargar Archivo"
      },
      "form": {
        "descrip": "Descripción: ",
        "descrip_file": "Descripción del Archivo",
        "file": "Archivo",
        "file_name": "Titulo del Archivo: ",
        "file_name2": "Titulo del Archivo",
        "send": "Enviar"
      },
      "standalone_card": {
        "download_file": "Descargar Archivo"
      }
    }
  },
  "managers": {
    "bit": {
      "error_connection": "Ocurrio un error, no se pudo acceder a la información de bit",
      "error_course": "Ocurrio un error al crear el curso.",
      "error_user": "No se pudo guardar a el usuario: ",
      "success_importing_group": "Grupo importado correctamente, Se ha creado el curso."
    },
    "comments": {
      "index": {
        "actions": "Acciones",
        "comment": "Comentario",
        "comment_in": "Comentario en",
        "comments1": "Comentarios",
        "confirm": "Estas seguro de borrar este comentario.",
        "course": "Curso",
        "create_date": "Fecha de creación",
        "delete": "Borrar",
        "discuss": "Discusión",
        "hmwrk": "Tarea",
        "like": "Me gusta",
        "no_user": "No tiene usuario",
        "public": "Publico",
        "quest": "Cuestionario",
        "user": "Usuario",
        "view": "Ver"
      },
      "show": {
        "author": "Autor",
        "back": "← Regresar",
        "comment": "Comentario",
        "comment_in": "Comentario en",
        "confirm": "Estas seguro de borrar este comentario.",
        "course": "Curso",
        "create_date": "Fecha de Creación",
        "delete": "Borrar",
        "discuss": "Discusión",
        "hmwrk": "Tarea",
        "like": "Me Gusta",
        "public": "Publico",
        "quest": "Cuestionario",
        "user": "Usuario"
      }
    },
    "correct_course": "Curso creado correctamente",
    "correct_deleted": "Comentario borrado correctamente",
    "course_delete": "Curso borrado correctamente.",
    "course_error1": "Ocurrio un error al crear el curso",
    "course_error2": "Ocurrio un error al crear el curso",
    "course_error3": "Ocurrio un error al editar el curso",
    "course_error4": "Ocurrio un error al borrar el curso",
    "courses": {
      "edit": {
        "edit1": "Editar Curso"
      },
      "index": {
        "actions": "Acciones",
        "courses": "Cursos",
        "create": "Crear curso",
        "delete": "Borrar",
        "edit": "Editar",
        "inte_date": "Fecha de creación",
        "name": "Nombre",
        "students": "Estudiantes",
        "sure": "Estas seguro de borrar este curso.",
        "teachers": "Profesores"
      },
      "new": {
        "create_course": "Crear Curso"
      },
      "shared": {
        "form": {
          "add": "Agrega profesores al curso.",
          "cancel": "Cancelar",
          "create": "Crear Curso",
          "descrip": "Descripción",
          "enroll": "Inscribe estudiantes a tu curso.",
          "example": "Ejemplo",
          "example2": "Matemáticas I",
          "find": "Busca profesores para administrar el curso.",
          "find2": "Busca estudiantes para unirlos automaticamente al curso.",
          "init_date": "Fecha de Inicio",
          "init_date2": "Fecha inicio",
          "last_name": "Escribe un nombre o apellido.",
          "name": "Nombre",
          "privacy": "Privacidad",
          "private": "Privado",
          "public": "Público",
          "save": "Guardar cambios",
          "students": "Alumnos",
          "teachers": "Profesores",
          "write_name": "Escribe un nombre o apellido."
        },
        "managers_courses_subnav": {
          "list": "Listado"
        }
      },
      "show": {
        "comments": "Comentarios",
        "create_date": "Fecha de Creación",
        "delete": "Borrar",
        "descrip": "Descripción",
        "edit": "Editar",
        "files": "Archivos",
        "hmwrks": "Tareas",
        "quest": "Cuestionarios",
        "return": "← Regresar",
        "students": "Alumnos",
        "sure": "Estas seguro de borrar este curso.",
        "teachers": "Maestros"
      }
    },
    "create": "Usuario creado correctamente.",
    "delete_content": "El contenido fue borrado correctamente.",
    "delete_discuss": "Discusión borrada correctamente.",
    "delete_error": "Ocurrió un error al borrar el comentario",
    "delete_report": "El reporte fue borrado correctamente.",
    "delete_success_usr": "Usuario borrado correctamente",
    "delete_test": "Cuestionario borrado correctamente.",
    "deliveries": {
      "index": {
        "actions": "Acciones",
        "course": "Curso",
        "delete": "Borrar",
        "end_date": "Fecha de finalización",
        "hmwrks": "Tareas",
        "init_date": "Fecha de creación",
        "name": "Nombre",
        "no_user": "No tiene usuario",
        "published": "Publicada",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta tarea.",
        "unpublished": "Sin Publicar",
        "user": "Usuario",
        "view": "Ver"
      },
      "show": {
        "course": "Curso",
        "delete": "Borrar",
        "descrip": "Descripción",
        "end_date": "Fecha de finalización",
        "init_date": "Fecha de Creación",
        "published": "Publicada",
        "return": "← Regresar",
        "state": "Estado",
        "sure": "Estas seguro de borrar este cuestionario.",
        "teacher": "Maestro",
        "unpublished": "Sin Publicar"
      }
    },
    "discussions": {
      "index": {
        "actions": "Acciones",
        "course": "Curso",
        "delete": "Borrar",
        "discuss": "Discusiones",
        "eval": "Evaluable",
        "init_date": "Fecha de creación",
        "name": "Nombre",
        "non_eval": "No Evaluable",
        "published": "Publicada",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta discusión.",
        "type": "Tipo",
        "unpublished": "Sin Publicar",
        "view": "Ver"
      },
      "show": {
        "course": "Curso",
        "delete": "Borrar",
        "descrip": "Descripción",
        "eval": "Evaluable",
        "init_date": "Fecha de Creación",
        "non_eval": "No Evaluable",
        "public": "Publica",
        "published": "Publicada",
        "return": "← Regresar",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta discusión.",
        "teacher": "Maestro",
        "type": "Tipo",
        "unpublished": "Sin Publicar"
      }
    },
    "edit_correct": "Curso editado correctamente",
    "edit_error": "Error al editar el usuario",
    "error_delete_user": "Error al borrar el usuario",
    "error_user": "Ocurrio un error al crear el usuario",
    "file": "Tipo de archivo no soportado",
    "hmwrk_delete": "Tarea borrada correctamente.",
    "import_members": {
      "course": "Course",
      "download": "Descargar archivo de cursos",
      "import1": "Importar miembros",
      "import2": "Importa los miembros de los cursos desde una base de datos.",
      "import3": "Importar lista de usuarios",
      "import4": "¿Importar?",
      "list": "Lista donde se puede importar.",
      "no_file": "NO SE ENCONTRO EL ARCHIVO",
      "text1": "Es importante tomar en cuenta que el formato del archivo es fundamental para importar correctamente los cursos.",
      "text2": "Propietario solo puede ser 0 o 1, donde 0 es para referirse a que aquel usuario sera el dueño del curso mientras que 1 es para especificar que solo es un miembro del curso nada más.",
      "text3": "El Email debe de ser el correo asociado al usuario."
    },
    "index": {
      "actual": "Actual",
      "comments": "Comentarios",
      "courses": "Cursos",
      "discuss": "Discusiones",
      "exams": "Examenes",
      "hmwrks": "Tareas",
      "pop": "Población esperada",
      "stat": "Estadisticas",
      "usr": "Usuarios"
    },
    "mailer": {
      "example": "Ejemplo",
      "example2": "Ceremonia de clausura",
      "masive": "Mail Masivo",
      "masive2": "Envía un mail a todos los miembros de tu comunidad.",
      "msg": "Mensaje",
      "send": "Enviar",
      "subject": "Asunto"
    },
    "menu": {
      "admin": "Administración",
      "config": "Configuración",
      "import_cur": "Importar cursos",
      "import_std": "Importar alumnos de curso",
      "import_usr": "Importar usuarios",
      "masive": "Correo Masivo",
      "usr": "Usuarios"
    },
    "no_delete": "No puedes borrar este usuario.",
    "no_edit": "No puedes editar ese usuario.",
    "proc_file": "Tu archivo esta siendo procesado, recibiras un correo electrónico de confirmación",
    "reported_contents": {
      "index": {
        "actions": "Acciones",
        "author": "Autor",
        "delete_content": "Borrar Contenido",
        "delete_report": "Borrar Reporte",
        "report_content": "Contenidos Reportados",
        "report_date": "Fecha de reporte",
        "sure": "¿Está seguro de borrar este contenido?",
        "sure2": "¿Está seguro de borrar este reporte?, el contenido no será borrado.",
        "usr": "Usuario",
        "view": "Ver"
      }
    },
    "settings": {
      "config": "Configuración"
    },
    "shared": {
      "managers_sidebar": {
        "comments": "Comentarios",
        "config": "Configuración",
        "courses": "Cursos",
        "discuss": "Discusiones",
        "hmwrk": "Tareas",
        "masive": "Correo Masivo",
        "quest": "Cuestionarios",
        "report_content": "Contenido Reportado",
        "stat": "Estadisticas",
        "usr": "Usuarios"
      },
      "managers_user_header": {
        "admin": "Administrador",
        "edit": "Editar perfil",
        "exit": "Salir del administrador",
        "help": "Ayuda",
        "log_out": "Cerrar sesión"
      }
    },
    "success_usr": "Usuario editado correctamente",
    "surveys": {
      "index": {
        "actions": "Acciones",
        "course": "Curso",
        "delete": "Borrar",
        "end_date": "Fecha de finalización",
        "init_date": "Fecha de creación",
        "name": "Nombre",
        "no_user": "No tiene usuario",
        "published": "Publicada",
        "quest": "Cuestionarios",
        "state": "Estado",
        "sure": "Estas seguro de borrar este cuestionario.",
        "unpublished": "Sin Publicar",
        "user": "Usuario",
        "view": "Ver"
      },
      "show": {
        "course": "Curso",
        "delete": "Borrar",
        "end_date": "Fecha de finalización",
        "init_date": "Fecha de creación",
        "return": "← Regresar",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta tarea.",
        "teacher": "Maestro"
      }
    },
    "users": {
      "edit": {
        "edit1": "Editar Usuario"
      },
      "import": {
        "download": "Descargar archivo de usuarios",
        "import2": "Importar Usuarios",
        "import3": "Importa los usuarios de tu comunidad desde una base de datos.",
        "import4": "Es importante tomar en cuenta que el formato del archivo es fundamental para importar correctamente los usuarios.",
        "import5": "Importar archivo de usuarios",
        "no_find": "NO SE ENCONTRO UN ARCHIVO",
        "text1": "El role puede ser estudiante o maestro.",
        "text2": "El email debe de ser el email del usuario."
      },
      "index": {
        "actions": "Acciones",
        "create": "Crear usuario",
        "delete": "Borrar",
        "edit": "Editar",
        "email": "Correo electrónico",
        "enroll": "Fecha de registro",
        "name": "Nombre",
        "sure": "Estas seguro de borrar este usuario.",
        "type": "Tipo de usuario",
        "usr": "Usuarios",
        "view": "Ver"
      },
      "new": {
        "create": "Crear Usuario"
      },
      "shared": {
        "form": {
          "admin": "Administrador",
          "cancel": "Cancelar",
          "create": "Crear Usuario",
          "email": "Correo electrónico",
          "last_names": "Apellidos",
          "name": "Nombre(s)",
          "pwd": "Contraseña",
          "save": "Guardar cambios",
          "student": "Alumno",
          "teacher": "Profesor",
          "type": "Tipo de usuario"
        },
        "managers_users_subnav": {
          "import": "Importar",
          "list": "Listado"
        }
      },
      "show": {
        "bio": "Biografia",
        "delete": "Borrar",
        "deliveries": "Tareas entregadas",
        "edit": "Editar",
        "email": "Correo electrónico",
        "eval": "Participación en discusiones evaluables",
        "info": "Si información",
        "last": "Ultimo inicio de sesión",
        "quest": "Cuestionarios contestados",
        "return": "← Regresar",
        "sure": "Estas seguro de borrar este usuario.",
        "type": "Tipo de usuario"
      }
    }
  },
  "managers_controller": {
    "in_stack": "Su correo se ha puesto en cola para enviar."
  },
  "members_in_courses": {
    "create": {
      "enrolled": "Te has inscrito",
      "request_send": "Solicitud enviada"
    }
  },
  "messages": {
    "index": {
      "no_member": "No eres parte del grupo!",
      "send": "Enviar Mensaje"
    }
  },
  "messages_controller": {
    "no_send": "No puedes enviar correo a los estudiantes del curso"
  },
  "modal": {
    "delivery_modal": {
      "hmwrk_not_found": "La tarea que tratas de ver ya no existe, ponte en contacto con el profesor del curso."
    },
    "discussion_modal": {
      "discussion_not_found": "La discusión que tratas de ver ya no existe, ponte en contacto con el profesor del curso."
    },
    "google_form_modal": {
      "form_not_found": "El formulario que tratas de ver ya no existe, ponte en contacto con el profesor del curso."
    },
    "reported_content_modal": {
      "publ_not_found": "La publicación que tratas de denunciar ya no existe."
    },
    "survey_modal": {
      "no_modal_found": "El cuestionario que tratas de ver ya no existe, ponte en contacto con el profesor del curso."
    }
  },
  "networks": {
    "alertmethod": {
      "net": "Ir a la red a la que pertenezco",
      "text1": "Se ha encontrado que usted no es miembro de la red a al que intenta acceder, lo redireccionaremos a una red de la cual usted sea miembro, después de esto usted deberá loguearse."
    },
    "awaiting_confirmation": {
      "email": "Revisa tu correo electrónico",
      "log_in": "Inicia sesión",
      "send": "Se han enviado las instrucciones para activar tu cuenta."
    },
    "create": "Se ha creado una red.",
    "form": {
      "api_key": "API Key:",
      "authorization_keyword": "Palabra clave",
      "example": "Ejemplo: ",
      "form": "Habilitar formulario de registro publico.",
      "icon": "Imagen de inicio de sesión",
      "icon2": "Logo de la institución",
      "label": "Etiquetas",
      "msg": "Mensaje de bienvenida",
      "name": "Nombre",
      "net_evaluable": "Habilitar evaluables de la red. (Tareas, Cuestionarios y Discusiones evaluables)",
      "pop": "Población",
      "pwd": "Reestablecer contraseña al importar los usuarios",
      "save": "Guardar cambios",
      "subdomain": "Subdominio"
    },
    "index": {
      "new": "Nueva red"
    },
    "messages": {
      "search": {
        "network": "Buscador de Redes"
      },
      "update": {
        "success": "Configuración guardada correctamente."
      }
    },
    "network_mask": {
      "enroll": "Registrar usuario"
    },
    "new": {
      "new_net": "Crear nueva red"
    }
  },
  "networks_users": {
    "index": {
      "no_members": "no hay miembros en esta red",
      "records": "Usuarios registrados en el sistema"
    },
    "new": {
      "accept": "Acepto las normas y condiciones de esta plataforma",
      "select": "Selecciona un rol",
      "sign_in": "Ingresar a la plataforma",
      "suscribe": "suscribirme a la red"
    }
  },
  "notifier": {
    "accepted_message": {
      "accept": "Has sido aceptado en el curso",
      "button": "Si el botón superior no funciona, haz click aquí",
      "hello": "¡Hola"
    },
    "csv_import_email": {
      "error": "¡Error!",
      "hello": "¡Hola",
      "results": "Te anexamos los resultados de la importación de usuarios",
      "success": "Exito"
    },
    "masive_mailer_for_super_admin": {
      "user": "Estimados usuarios de Cúrsame"
    },
    "new_delivey_notification": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "course_notif": "Tarea en el curso",
      "deliver": "Entregar antes del"
    },
    "new_discussion_notification": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "discuss": "Discusión en el curso"
    },
    "new_member_in_course": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "course": "Desea formar parte de tú curso"
    },
    "new_survey_notification": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "deliver": "Entregar antes del",
      "hmwrk": "Tarea en el curso"
    },
    "send_comment_on_course": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "comment": "comentó en un comentario en el curso",
      "comment2": "comentó en el curso"
    },
    "send_contact_mail": {
      "contact": "Contacto Normal",
      "demo": "Solicitud de Demo",
      "ext": "Extensión",
      "msg": "Mensaje",
      "name": "Nombre",
      "other": "Otro",
      "pos": "Posicion",
      "school": "Escuela",
      "tel": "Telefono"
    },
    "send_email": {
      "msg": "Mensaje del administrador de la red",
      "net": "Ir a la red"
    },
    "send_email_members_in_course": {
      "net": "Ir a la red",
      "notif": "Notificación"
    },
    "send_import_courses": {
      "error": "Error",
      "line": "Linea",
      "no_error": "No hubo errores"
    },
    "send_import_members": {
      "course": "Curso",
      "error": "Error",
      "line": "Linea",
      "no_error": "No hubo errores"
    },
    "send_import_users": {
      "error": "Error",
      "line": "Linea"
    },
    "user_mailer_with_password": {
      "accept": "has sido aceptado aceptado en Cúrsame.",
      "active": "Activado",
      "hello": "Hola",
      "net": "Ir a la red",
      "text1": "puedes cambiarla al iniciar sessión.",
      "text2": "Si no puedes ver este mail,",
      "text3": "haz click aquí.",
      "text4": "¡Feliz día del Maestro!",
      "text5": "En Cúrsame estamos muy orgullosos de tí y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text6": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text7": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Maestro ¡Te lo mereces!",
      "welcome": "Bienvenido",
      "your_pwd": "Tu constraseña es"
    }
  },
  "number": {
    "currency": {
      "format": {
        "delimiter": ",",
        "format": "%u%n",
        "precision": 2,
        "separator": ".",
        "significant": false,
        "strip_insignificant_zeros": false,
        "unit": "$"
      }
    },
    "format": {
      "delimiter": ",",
      "precision": 2,
      "separator": ".",
      "significant": false,
      "strip_insignificant_zeros": false
    },
    "human": {
      "decimal_units": {
        "format": "%n %u",
        "units": {
          "billion": "mil millones",
          "million": "millón",
          "quadrillion": "mil billones",
          "thousand": "mil",
          "trillion": "billón",
          "unit": ""
        }
      },
      "format": {
        "delimiter": ",",
        "precision": 3,
        "significant": true,
        "strip_insignificant_zeros": true
      },
      "storage_units": {
        "format": "%n %u",
        "units": {
          "byte": {
            "one": "Byte",
            "other": "Bytes"
          },
          "gb": "GB",
          "kb": "KB",
          "mb": "MB",
          "tb": "TB"
        }
      }
    },
    "percentage": {
      "format": {
        "delimiter": ","
      }
    },
    "precision": {
      "format": {
        "delimiter": ","
      }
    }
  },
  "polls": {
    "answer_fields": {
      "answer": "Ingresar respuesta",
      "correct": "¿Es la respuesta correcta?",
      "delete": "Eliminar"
    },
    "edit": {
      "edit": "Editando Encuesta"
    },
    "index": {
      "list": "Lista de Encuestas"
    },
    "question_fields": {
      "add": "Agregar Respuesta",
      "delete": "Eliminar",
      "quest": "Ingresar pregunta"
    }
  },
  "publications": {
    "discussion_template": {
      "discuss": "ha inicidado una discusión",
      "in_course": "en el curso"
    }
  },
  "registrations": {
    "edit": {
      "bios": "Biografía",
      "cancel": "Cancelar mi cuenta",
      "cancel2": "Cancelar",
      "confirm": "¿Estas seguro de que quieres darte de baja de Cúrsame?",
      "dir": "Dirección",
      "down": "¿Quieres darte de baja?",
      "edit": "Editar Perfil",
      "email": "Correo electrónico",
      "example": "Ejemplo",
      "last_name": "Apellido",
      "name": "Nombre",
      "pwd": "Escribe tu contraseña para guardar",
      "text1": "Recuerda no colocar espacios ni simbolos como",
      "text2": "ya que no se aceptará tu url",
      "update": "Actualizar perfil"
    },
    "edit_user": {
      "back": "Regresar",
      "cancel": "Cancela tu cuenta",
      "down": "¿Quieres darte de baja?",
      "edit": "Editar Usuario",
      "update": "Actualizar"
    },
    "new": {
      "accept": "Acepto los",
      "confirm_pwd": "Confirmar contraseña",
      "confirm_pwd2": "Confirmacion de contraseña",
      "email": "Correo electrónico",
      "last_name": "Apellidos:",
      "name": "Nombre(s)",
      "pwd": "Contraseña",
      "sign_in": "Registrarme",
      "student": "Regístrate Alumno",
      "teacher": "Regístrate Profesor",
      "terms": "Términos y Condiciones",
      "text1": "Lo sentimos pero la red a la que estas intentado no permite el registro público. pregunta a un encargado de tu escuela él sabrá ayudarte.",
      "text2": "Ir a la página principal",
      "type": "Tipo de usuario"
    },
    "send_confirmation": {
      "send_confirmation": "Se envio la confirmacion"
    }
  },
  "registrations_controller": {
    "error": "El perfil no pudo actualizarce correctamente",
    "update": "Se a actualizado correctamente tu perfil"
  },
  "reported_contents": {
    "denounce_fail": "Algo sucedió que no se pudo guardar tu denuncia.",
    "denounce_success": "Tu denuncia ha sido realizada con éxito.",
    "shared": {
      "reported_content_modal": {
        "comment": "Escribe un comentario",
        "help_us": "Ayúdanos a entender qué sucede",
        "reported_content": "Ya has reportado este contenido, el administrador de la red tomará acciones.",
        "send": "Enviar",
        "why_no_content": "¿Por qué no quieres ver este contenido?"
      }
    }
  },
  "shared": {
    "assets_for_assignments": {
      "new_assets": {
        "attach_file": "Adjuntar archivo"
      }
    },
    "assets_form": {
      "new_assets": {
        "file": "Archivo"
      }
    },
    "chat": {
      "add_message_form": {
        "msg": "Escribe un mensaje y presiona Enter."
      },
      "chat": {
        "more_msg": "Cargar más mensajes...",
        "select": "Selecciona a un amigo o curso para enviar mensaje."
      },
      "load_more_messages": {
        "more_msg": "Cargar más mensajes..."
      },
      "message_notifications": {
        "ago": "Hace",
        "all_msg": "Ver todos los mensajes",
        "msg": "Mensajes"
      },
      "message_tpl": {
        "ago": "hace"
      }
    },
    "comment": {
      "comment_main": {
        "like": "me gusta"
      }
    },
    "comment_form": {
      "file": "Archivo",
      "new_publication": {
        "cancel": "Cancelar",
        "comment": "Comentar",
        "file": "Archivo",
        "public": "Público",
        "save": "Guardar"
      }
    },
    "comments": {
      "publication_box": {
        "more_comments": "cargas mas comentarios",
        "twlv_likes": "12 Likes",
        "twty_comments": "20 Comentarios"
      }
    },
    "course_joyride": {
      "joyRideTipContent": {
        "content_area": "Esta es el área de creación de contenido.",
        "course_descrip": "Aquí va la descripción del curso.",
        "course_edit": "Editar el curso",
        "create_content": "Creación de contenido",
        "descrip": "Descripción",
        "ed_course": "Aquí puedes editar el curso.",
        "edit_course": "Editar el curso",
        "friends": "Amigos",
        "friends_list": "Aquí encontrarás un listado de tus amigos",
        "notif": "Notificaciones",
        "notif_area": "Esta es el área de notificaciones.",
        "profile": "Perfil",
        "pub_area": "Aquí encontrarás todas las publicaciones de la red.",
        "publications": "Publicaciones",
        "sub_profile": "Este es el perfil del curso.",
        "subtitle": "En este lugar podrás ver todo lo que pasa en el curso.",
        "text_edit_course": "Aqui puedes editar el curso.",
        "welcome": "Bienvenido al perfil de curso"
      }
    },
    "delivery_publication_tpl": {
      "category": "rubro",
      "edit_delivery": "Editar Entrega",
      "end_delivery": "Entregar antes de",
      "evaluates": "Se evalua",
      "files": "Archivos",
      "final_eval": "Evaluación final",
      "no_evaluation": "A esta tarea no se le han asignado áreas de evaluación",
      "no_reply": "No se han encontrado respuestas a esta tarea",
      "reply": "Responder",
      "view_delivery": "Ver entrega de tarea"
    },
    "dropdown": {
      "dropdown_v": {
        "courses": "Cursos",
        "goto_section": "Únete a uno en la sección de",
        "new_course": "Crear curso ahora →",
        "no_course": "No has creado ningún curso todavia.",
        "no_member": "No eres miembro de ningún curso.",
        "public": "Público",
        "return": "Volver"
      },
      "return": "Volver"
    },
    "evaluation_criteria": {
      "evaluation_criteria_fields": {
        "criteria_name": "Nombre del criterio a evaluar"
      }
    },
    "form_commentable": {
      "comment": "Comentar",
      "comment_2": "Comentar",
      "write_comment": "Escribe un comentario"
    },
    "network_joyride": {
      "joyride_tip_content": {
        "courses": "Creación de cursos",
        "description": "En este tour te mostraremos el nuevo diseño y las herramientas que podras utilizar dentro de nuestra plataforma.",
        "description_courses": "Al dar click en el bootón Crear (+) aparecera el formulario de creación para los cursos que impartes.",
        "menu": "Menú de creación",
        "menu_description": "En un solo lugar puedes crear Comentarios, Tareas, Discusiones y Cuestionarios.",
        "text1": "Público o a tus cursos",
        "text10": "En esta sección podrás ver a tus amigos, o ingresar a la \"Comunidad\" para agregarlos",
        "text11": "Menú interactivo",
        "text12": "Dependiendo la sección en la que te encuentres este menú mostrará herramientas de utilidad.",
        "text13": "Video tutoriales de ayuda",
        "text14": "En cada sección donde veas un signo de interrogación \"?\", al dar click en el podras ver un video sobre como usar dicha función.",
        "text2": "Podrás escoger si tus publicaciones son públicas para toda la red o para uno o varios de tus cursos.",
        "text3": "Uno o varios cursos",
        "text4": "!Tendrás la posibilidad de escoger si lo que creas pertenece a uno, varios o todos los cursos! .",
        "text5": "Muro principal",
        "text6": "En el muro principal aparecerán todas las publicaciones de tus cursos y amigos.",
        "text7": "Filtrado de publiciones",
        "text8": "Con el menu de filtrado podrás escoger que tipo de publicación quieres ver en el muro.",
        "text9": "Amigos",
        "welcome": "Bienvenido a Cúrsame"
      }
    },
    "notification_type": {
      "activity_feed": {
        "accept_course": "Has sido aceptado en el curso",
        "active": "activado",
        "activities_p_user": "Una actividad por",
        "add_to_course": "ha solicitado entrar al curso",
        "comment_course": "comentó en el curso",
        "comment_net": "comentó en la red",
        "comment_profile": "ha comentado en tu perfil.",
        "comment_to_comment": "ha comentado en un comentario que hiciste.",
        "comment_to_homework": "ha comentado en la tarea",
        "course_calif": "Se ha calificado el curso",
        "course_expired": "ha llegado a su fecha final. Por favor desactívalo.",
        "coursework": "del curso",
        "discuss_comment": "comentó en tu discusión",
        "ended": "finalizado",
        "friend_notif": "ha solicitado ser su amigo",
        "friend_req": "ha aceptado su solicitud de amistad.",
        "homework_calif": "Han calificado tu tarea",
        "in_course": "en tu curso",
        "in_course1": "en tu curso",
        "in_course2": "en tu curso",
        "in_network": "en tu red",
        "lookup_usr": "Ver usuario",
        "new_course": "Nuevo curso",
        "new_discus": "Nueva discusion",
        "new_homework": "Nueva tarea",
        "new_question": "Nuevo cuestionario",
        "one_usr": "Un usuario",
        "quest_feedback": "Has recibido retroalimentación en el cuestionario",
        "quest_response": "ha respondido el cuestionario",
        "response_homework": "ha respondido la tarea",
        "text15": "El curso",
        "text16": "ha sido",
        "text17": "Han calificado tu participacion en la discusión",
        "the_course": "El curso",
        "view_usr": "Ver usuario"
      }
    },
    "notifications": {
      "box_notifications": {
        "more_notif": "Ver más notificaciones",
        "no_notif": "No hay notificaciones para mostrar.",
        "notif": "Notificaciones"
      }
    },
    "post_comments": {
      "comment": "Comentar",
      "comment1": "Comentar",
      "delte": "Borrar",
      "last_comments": "Ver comentarios anteriores",
      "like": "me gusta",
      "write_comment": "Escribe un comentario"
    },
    "post_menu": {
      "comment": "Comentario",
      "discussion": "Discusión",
      "form": "Formulario",
      "homework": "Tarea",
      "post_comment": "Deja un comentario.",
      "questionnaire": "Cuestionario",
      "what_are_y_think": "¿Qué estás pensando?"
    },
    "posts": {
      "post_admin_actions": {
        "confirm_delete": "¿Estás seguro de borrar esto?",
        "delete": "Borrar",
        "edit": "Editar"
      },
      "post_child_comment": {
        "like": "Me gusta",
        "not_like": "Ya no me gusta"
      },
      "post_comments": {
        "comment": "Comentar",
        "delete": "Borrar",
        "like": "me gusta",
        "view_comments": "Ver comentarios anteriores",
        "write_comment": "Escribe un comentario"
      },
      "post_comments_list": {
        "non_commentable": "Esta publicación ya no se puede comentar.",
        "prev_comments": "Comentarios anteriores",
        "write_comment": "Escribe un comentario"
      },
      "post_meta_data": {
        "like": "Me gusta",
        "not_like": "Ya no me gusta"
      },
      "post_people_who_liked": {
        "ed": "A",
        "liked": "les gusta esto"
      }
    },
    "publications": {
      "comment": {
        "course_comment": "comentó en el curso",
        "profile_comment": "comentó en el perfil de",
        "usr": "Usuario"
      },
      "course": {
        "go_course": "Ir al curso",
        "new_course": "Nuevo curso público"
      },
      "delivery": {
        "delivery_txt": "Entregar antes del",
        "new_homework": "Nueva tarea para entregar en el curso",
        "open_hmwk": "Abrir tarea"
      },
      "discussion": {
        "in_course": "en el curso",
        "new": "Nueva discusión",
        "open_discuss": "Abrir discusion"
      },
      "meta_data": {
        "ago": "Hace",
        "at": "a las",
        "comments": "Comentarios",
        "like": "Me gusta"
      },
      "owner_edit_publications": {
        "confirm": "¿Estas seguro de borrar esto?",
        "delete": "Borrar",
        "edit": "Editar"
      },
      "people_who_likes": {
        "users": "Usuarios a los que les gusta esto"
      },
      "publication_comments": {
        "prev_comments": "Ver comentarios anteriores"
      },
      "publication_template": {
        "edit_publ": "Editar publicación"
      },
      "survey": {
        "new_quest": "Nuevo cuestionario para responder en el curso",
        "open_quest": "Abrir cuestionario",
        "question": "Pregunta",
        "questions": "Preguntas",
        "response_before": "Responder antes del"
      }
    },
    "publications_filter": {
      "filter_by_course_publications": {
        "filtrate": "Filtrar",
        "select_course": "Selecciona un curso"
      }
    },
    "sessions": {
      "network_box_head": {
        "log_in": "¿Ya eres usuario? Ingresa →",
        "sign_in": "Registrarme →"
      },
      "network_not_exist": {
        "no_net_exists": "Parece que la red a la que quieres accesar no existe. Pregunta a un encargado de tu escuela él sabrá ayudarte.",
        "no_network": "No ingresaste el subdominio de la red a la que quieres acceder.",
        "ops": "¡Oops!",
        "search_school": "Busca tu escuela aquí →"
      }
    },
    "sidebar": {
      "sidebar_section": {
        "activities": "Actividades",
        "add_friends": "Agrega a tus amigos en la sección de",
        "calendar": "Calendario",
        "chat": "Chat",
        "community": "Comunidad",
        "community_href": "Comunidad",
        "course_href": "Cursos",
        "course_message": "Únete a uno en la sección de",
        "courses": "Cursos",
        "discussion": "Discusiones",
        "disp_usr": "Usuario conectado",
        "friends": "Amigos",
        "goto_section": "Únete a uno en la sección de",
        "homework": "Tareas",
        "initiation": "Inicio",
        "library": "Biblioteca",
        "no_course": "No has creado ningún curso.",
        "no_course_href": "Crear curso ahora →",
        "no_disp_usr": "Usuario desconectado",
        "no_friends": "No tienes amigos.",
        "no_member": "No eres miembro de ningún curso.",
        "questionnaire": "Cuestionarios",
        "radar": "Radar",
        "ratings": "Calificaciones",
        "return": "volver",
        "vLex": "vLex"
      },
      "upcomming_deliveries_widget": {
        "side_section": {
          "pending_homeworks": "Tareas próximas"
        }
      },
      "upcomming_surveys_widget": {
        "side_section": {
          "next_questionnaires": "Cuestionarios próximos"
        }
      }
    },
    "static_pages": {
      "header": {
        "notif": "Oops! al parecer tu correo no pertenece a niguna red.",
        "search_network": "Busca tu red",
        "text1": "¿Ya eres usuario?",
        "text2": "Encuentra tu red",
        "text3": "Escribe tu correo electrónico para accesar a la red de tu institución.",
        "title1": "Metodologías",
        "title2": "Proyectos",
        "title3": "Nosotros",
        "title4": "Empleos",
        "title5": "Contacto"
      }
    },
    "survey_publication_tpl": {
      "respond_quest": "Cuestionario respondido"
    },
    "tour": {
      "survey_first_login": {
        "priv": "Aviso de Privacidad",
        "quest": "Enviar Encuesta",
        "text4": "Tus datos son confidenciales y serán utilizados con el fin de",
        "text5": "mejorar nuestro servicio, Revisa nuestro",
        "thnx": "Gracias.",
        "title": "Ayúdanos a mejorar",
        "title2": "Para Cúrsame es muy importante su participación, a continuación se le presentan algunas preguntas que nos permitirán mejorar continuamente y ofrecer una herramienta congruente con sus necesidades.",
        "title3": "Para Cúrsame es muy importante tu participación, a continuación se te presentan algunas preguntas que nos permitirán conocerte mejor. Tus respuestas son confidenciales y se usaran con el fin de mejorar continuamente."
      },
      "video_tour_first_time": {
        "loading_tour": "Cargando tour...",
        "wel_text": "Por favor mira con atención este tour inicial para que conozcas las principales secciones de la nueva plataforma.",
        "wel_text1": "En este pequeño video de introducción te mostramos las principales secciones de tu perfil y el de tus amigos.",
        "wel_text2": "En este video de introducción te mostramos las principales secciones y características del curso.",
        "welcome": "Bienvenido al nuevo Cúrsame"
      }
    },
    "user_header": {
      "activity_block": {
        "admin_href": "Administración",
        "edit_profile_href": "Editar perfil",
        "profile_href": "Ir a mi perfil",
        "sign_out_href": "Cerrar sesión"
      },
      "activity_notifications": {
        "help": "Ayuda"
      }
    },
    "user_joyride": {
      "content": "Creación de contenido",
      "content_area": "Esta es el area de creación de contenido.",
      "courses": "Cursos",
      "courses_area": "Esta es el area de tus cursos.",
      "edit_prof": "Editar perfil",
      "friends": "Amigos",
      "friends_list": "Aqui encontraras un listado de tus amigos",
      "notif": "Notificaciones",
      "prof": "Perfil",
      "prof_photo": "Aqui ver la foto de tu perfil.",
      "publ": "Publiciones",
      "publ_area": "Aqui encontraras todas las publicaciones de la red.",
      "text_edit_prof": "Aqui puedes editar tu perfil.",
      "text_notif": "Esta es el area de notificaciones.",
      "text_prof": "En este lugar podrás ver todo lo que pasa en tu red cursame.",
      "welcome_prof": "Bienvenido a tu perfil"
    },
    "wall_filters": {
      "all": "Todos",
      "comments": "Comentarios",
      "courses": "Cursos",
      "discuss": "Discusiones",
      "homework": "Tareas",
      "quest": "Cuestionarios"
    },
    "website": {
      "cta_request_demo": {
        "request_demo": "¡Solicita un demo en tu plantel!"
      },
      "other_contact_ways": {
        "follow_us_on_facebook": "Síguenos en Facebook",
        "follow_us_on_twitter": "Síguenos en Twitter",
        "text1": "Otras formas de contacto"
      }
    }
  },
  "superadmin": {
    "activities": {
      "activities": "Las actividades del sistema están geo localizadas",
      "activity": "Actividad por",
      "avg": "Promedio de calificación por tareas",
      "avg2": "Promedio de calificación por survey",
      "avg3": "Promedio de calificación por usuario",
      "avg4": "Promedio",
      "comments": "Comentarios",
      "courses": "Cursos",
      "exam": "Exámenes",
      "exam_delivery": "Entregas de examenes",
      "find": "Buscar Actividades por usuario o titulo",
      "goto": "Ir a la actividad",
      "hmwrks": "Tareas",
      "hmwrks_delivery": "Entregas de tareas",
      "lat": "Latitud",
      "long": "Longitud",
      "net": "Red",
      "no_act": "sin actividades",
      "os": "Sistema operativo",
      "place": "Lugar",
      "sys": "Actividades del sistema",
      "title": "Título",
      "type": "Tipo de Actividad",
      "ver": "Versión"
    },
    "courses_sintetic_view_and_edit": {
      "courses": "Visor de cursos",
      "hmwrks": "Tareas",
      "hmwrks_delivery": "Entregas de tarea",
      "quest": "Cuestionarios",
      "show": "Muestra los cursos de las redes, sus miembros y sus actividades",
      "show2": "Mostrar tareas",
      "show3": "Mostrar cuestionarios",
      "show4": "Mostrar estadísticas del curso",
      "show5": "Ver entregas",
      "stat": "Estadísticas"
    },
    "create_super_admin": {
      "enroll": "Registrar usuario",
      "img": "Puedes ver las instrucciones de creación de super admin accediendo al código qr",
      "superuser": "Super administrador Cúrsame"
    },
    "instructions": {
      "create": "Instrucciones para creación de súper administradores",
      "link": "Crea coloca tu nombre, apellido, email y contraseña, da click en continuar y listo"
    },
    "networks": {
      "admin": "Administrar networks",
      "create": "Crear Red",
      "create_net": "Creando networks",
      "edit": "Editar",
      "net": "Red",
      "subdomain": "Subdominio"
    },
    "statics": {
      "activities": "Actividades",
      "events": "Eventos",
      "exam": "Examenes",
      "exam_delivery": "Entrega de examenes",
      "hmwrks": "Tareas",
      "hmwrks_delivery": "Entrega de tareas",
      "statics1": "Estadísticas del sistema"
    },
    "users": {
      "activities": "Manejador de actividades",
      "discuss": "Discusiones",
      "edit1": "Editar usuario",
      "exam": "Examenes",
      "find_usr": "Buscar Usuario",
      "hmwrks": "Tareas",
      "response": "Respuestas de tareas",
      "response2": "Respuestas de examen",
      "show1": "Mostrar actividades",
      "statics": "Estadísticas",
      "usr": "Manejador de datos de usuario"
    }
  },
  "support": {
    "array": {
      "last_word_connector": " y ",
      "two_words_connector": " y ",
      "words_connector": ", "
    }
  },
  "surveys": {
    "ajax": {
      "surveys_paginate_ajax": {
        "no_more_quest": "No se encontraron más cuestionarios pasados."
      }
    },
    "answer_fields": {
      "correct": "Correcta",
      "delete": "Eliminar",
      "response": "Ingresar respuesta"
    },
    "correct_create": "Cuestionario creado correctamente.",
    "correct_edit": "Cuestionario editado correctamente.",
    "form": {
      "add_quest": "Agregar Pregunta",
      "attempts": "Intentos",
      "cancel": "Cancelar",
      "courses": "Cursos",
      "create": "Crear Cuestionario",
      "dates": "Fechas",
      "deliver_date": "Fecha de entrega",
      "example": "Ejemplo",
      "non_mins": "Sin límite de tiempo",
      "publish_date": "Día de pubicación",
      "quest": "Preguntas",
      "save": "Guardar Cuestionario",
      "support": "Material de soporte",
      "text1": "Números primos",
      "timer": "Tiempo para resolución del cuestionario",
      "title": "Titulo del cuestionario"
    },
    "index": {
      "more_days": "Cuestionarios para responder en 3 días o más",
      "no_quest": "No tienes cuestionarios pendientes por contestar.",
      "section": "sección de cuestionarios Pasados",
      "see": "Puedes ver antiguos cuestionarios en la",
      "today": "Cuestionarios para responder Hoy",
      "tomorrow": "Cuestionarios para responder Mañana"
    },
    "lapsed": {
      "no_quest": "No se encontraron más cuestionarios pasados."
    },
    "my_surveys": {
      "no_quest": "No tienes cuestionarios por contestar."
    },
    "question_fields": {
      "add_answer": "Agregar Respuesta",
      "quest1": "Ingresar pregunta"
    },
    "select_course": "Selecciona un curso para publicar tu cuestionario.",
    "shared": {
      "survey_card": {
        "edit": "Editar Cuestionario",
        "no_limit_time": "Sin límite de tiempo",
        "notice_helper": "Este cuestionario te dará",
        "notice_helper2": "minutos para responderlo",
        "quest": "Ver Cuestionario",
        "solve_time": "Minutos"
      },
      "survey_modal": {
        "calif": "Calificación Obtenida",
        "fail_attemps": "No tienes más intentos",
        "feedback": "Retroalimentación",
        "quest": "Cuestionario en el curso",
        "response": "Responder antes del"
      },
      "survey_questions_modal": {
        "quest": "Enviar cuestionario"
      },
      "surveys_course_header": {
        "past": "Pasados",
        "quest": "Cuestionarios",
        "response": "Responder"
      },
      "surveys_courses_filter": {
        "filter": "Filtrar",
        "select": "Selecciona un curso"
      },
      "surveys_header": {
        "past": "Pasados",
        "quest": "Cuestionarios",
        "response": "Responder"
      },
      "surveys_paginate_button": {
        "load": "Cargar más..."
      }
    },
    "survey_response_tpl": {
      "answer": "Contestar",
      "cancel": "Cancelar"
    },
    "surveys_course": {
      "more_days": "Cuestionarios para responder en 3 días o más",
      "no_quest": "No tienes cuestionarios pendientes por contestar en este curso.",
      "past": "sección de cuestionarios Pasados",
      "see": "Puedes ver antiguos cuestionarios en la",
      "to_day": "Cuestionarios para responder Hoy",
      "tomorrow": "Cuestionarios para responder Mañana"
    },
    "surveys_course_lapsed": {
      "quest": "No se encontraron más cuestionarios pasados."
    }
  },
  "surveys_controller": {
    "no_accept": "Estas tratando de ver Cuestionarios de un curso donde no has sido aceptado.",
    "no_exist": "El cuestionario que intentas ver no existe o ha sido borrado.",
    "no_quest_accept": "Estas tratando de ver Cuestionarios de un curso donde no has sido aceptado.",
    "no_quest_register": "Estas tratando de ver Cuestionarios de un curso donde no estas inscrito.",
    "no_register": "Estas tratando de ver Cuestionarios de un curso donde no estas inscrito."
  },
  "time": {
    "am": "am",
    "formats": {
      "default": "%a, %d de %b de %Y a las %H:%M:%S %Z",
      "long": "%A, %d de %B de %Y a las %I:%M %p",
      "short": "%d de %b a las %H:%M hrs"
    },
    "pm": "pm"
  },
  "users": {
    "califications": {
      "deliveries_table": {
        "avg": "Calificación promedio en tareas",
        "hmwrk": "Tareas",
        "hmwrks": "Tarea",
        "no_deliver": "No entregada",
        "no_hmwrks": "Aún no hay tareas en este curso.",
        "no_score": "No calificada",
        "percent": "Porcentaje: %{number}%",
        "score": "Calificación"
      },
      "discussions_table": {
        "avg_score": "Calificación promedio en discusiones",
        "discuss": "Discusiones",
        "discuss2": "Discusión",
        "no_discuss": "Aún no hay discusiones evaluables en este curso.",
        "no_part": "Sin participación",
        "no_score": "No calificada",
        "percent": "Porcentaje: %{number}%",
        "score": "Calificación"
      },
      "enroll": "Necesitas estar inscrito en al menos un curso para tener calificaciones.",
      "no_score": "Aún no tienes calificaciones.",
      "ratings": "Calificaciones",
      "surveys_table": {
        "avg": "Porcentaje: %{number}%",
        "exam": "Examen",
        "no_answered": "No resuelto",
        "quest": "Cuestionarios",
        "quest2": "Calificación promedio en cuestionarios",
        "quest3": "Aún no hay cuestionarios en este curso.",
        "score": "Calificación"
      }
    },
    "courses": {
      "courses2": "Cursos",
      "find": "Busca cursos en la sección de",
      "no_members": "Este usuario no esta inscrito en ningún curso.",
      "no_registered": "Aún no estas inscrito en ningún curso."
    },
    "dashboard": {
      "goto": "Ir al super administrador",
      "log_out": "Salir de mi sesión",
      "select": "Seleccionador de redes",
      "text1": "Cuando usted seleccione la network debera iniciar sesión en la red a la que se le dirija ya que es una celula independiente del sistema"
    },
    "evaluation": {
      "no_members": "Este curso no tiene miembros",
      "score": "Calificacion"
    },
    "form_course": {
      "cancel": "Cancel",
      "create": "Crear nuevo",
      "create2": "Crear",
      "descrip": "Descripción",
      "init_date": "Fecha inicio",
      "load": "Cargando ...",
      "name": "Nombre",
      "private": "Privado",
      "public": "Público"
    },
    "friends": {
      "comunity": "Comunidad",
      "find": "Busca a tus amigos en la sección de",
      "friends_subtitle": {
        "all_friends": "Todos mis amigos",
        "friends1": "Amigos",
        "request": "Solicitudes pendientes"
      },
      "no_friends": "Aún no tienes amigos.",
      "no_friends2": "Este usuario no tiene amigos aún."
    },
    "friends_first_user": {
      "friend_req": "Solicitud de amistad",
      "friends": "Amigos",
      "pendent": "Solicitudes pendientes",
      "send": "Solicitud de amistad enviada"
    },
    "index": {
      "all": "Todos los usuarios"
    },
    "info": {
      "bio": "Biografia",
      "email": "Correo Electronico",
      "info2": "Información",
      "no_bio": "Este usuario no cuenta con biografia."
    },
    "menu_member": {
      "enroll": "inscribirse a una red",
      "friends": "mis amigos",
      "net": "mis redes"
    },
    "pendding_friends": {
      "no_request": "No hay solicitudes de amistad pendientes."
    },
    "set_password_form": {
      "pwd": "Ingresa una contraseña.",
      "save": "Guardar contraseña",
      "set_pwd": "Establece tu contraseña",
      "welcome": "Bienvenido a Cúrsame, es necesario que establezcas una contraseña para terminar con el proceso de registro."
    },
    "shared": {
      "user_card": {
        "add_friends": "Agregar a mis amigos",
        "admin": "Administrador",
        "cancel": "Cancelar solicitud de amistad",
        "confirm": "Confirmar solicitud de amistad",
        "delete": "Eliminar de mis amigos",
        "delete2": "Eliminar solicitud de amistad",
        "friends": "Amigos",
        "respond": "Responder solicitud de amistad",
        "send_request": "Solicitud enviada",
        "student": "Estudiante",
        "teacher": "Profesor"
      },
      "user_profile_header": {
        "accept": "Aceptar solicitud de amistad",
        "add_friends": "Añadir a mis amigos",
        "cancel": "Cancelar solictud de amistad",
        "courses": "Cursos",
        "edit": "Editar Perfil",
        "friends": "Amigos",
        "ignore": "Ignorar",
        "info": "Información",
        "publications": "Publicaciones",
        "send": "Solicitud enviada",
        "update": "Actualizar portada",
        "update_photo": "Actualizar foto"
      }
    },
    "show": {
      "add": "Agrégalo para poder postear en su muro.",
      "no_friend": "No eres amigo del usuario"
    },
    "sufriend": {
      "accept": "Aceptar como amigo",
      "name": "Nombre"
    },
    "waiting_friends": {
      "friends": "Amigos en espera",
      "request": "Este usuario te ha solicitado amistad",
      "waiting_friends": "Esperando aceptación de"
    }
  },
  "users_controller": {
    "canot_delete": "No puedes borrar este usuario.",
    "correct_delete": "Usuario fue borrado correctamente",
    "deleted_usr": "El Usuario ya fue borrado",
    "no_exist": "El usuario que intentas ver no existe o ha sido borrado.",
    "no_register": "no estas inscrito en ninguna red",
    "save_pwd": "Se ha guardado tu contraseña correctamente."
  },
  "users_mailer": {
    "notice_to_user": {
      "activity": "tiene 5 nuevas actividades en la plataforma.",
      "activitys": "Tiene 5 nuevas actividades en la plataforma.",
      "goto": "Ir a actividades",
      "hello": "Hola",
      "notif": "Tiene 5 notificaciones activas",
      "welcome": "Bienvenido"
    },
    "teachers_day": {
      "click": "haz click aquí.",
      "happy": "¡Feliz día del Maestro!",
      "hello": "Hola",
      "mail": "Si no puedes ver este mail",
      "teacher": "Profesor(a)",
      "text1": "En Cúrsame estamos muy orgullosos de tí y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text2": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text3": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Maestro ¡Te lo mereces!"
    }
  },
  "usessions": {
    "new": {
      "confirm": "Esperando confirmación",
      "email": "Correo electrónico",
      "init_session": "Iniciar sesión",
      "pwd": "Contraseña",
      "remember": "Recordarme",
      "send": "Se ha enviado un correo a"
    }
  },
  "usessions_controller": {
    "hello": "Hola ",
    "invalid": "No se ha creado correctamente la sesión ya que la contraseña o el email son inválidos.",
    "welcome": " bienvenido de nuevo."
  },
  "views": {
    "pagination": {
      "first": "Inicio",
      "last": "Último",
      "next": "Siguiente",
      "previous": "Anterior",
      "truncate": "..."
    }
  },
  "will_paginate": {
    "next_label": "Siguiente &#8594;",
    "page_gap": "&hellip;",
    "previous_label": "&#8592; Anterior"
  }
};
I18n.translations["es_meems"] = {
  "active_admin": {
    "any": "Cualquiera",
    "batch_actions": {
      "action_label": "%{title} seleccionado",
      "button_label": "Acciones en masa",
      "delete_confirmation": "Eliminar %{plural_model}: ¿Está seguro? No podrá deshacer esta acción.",
      "labels": {
        "destroy": "Borrar"
      },
      "link": "Añadir",
      "selection_toggle_explanation": "(Cambiar selección)",
      "succesfully_destroyed": {
        "one": "Se ha destruido 1 %{model} con éxito",
        "other": "Se han destruido %{count} %{plural_model} con éxito"
      }
    },
    "blank_slate": {
      "content": "No hay %{resource_name} aún.",
      "entry": {
        "one": "registro",
        "other": "registros"
      },
      "link": "Añadir"
    },
    "cancel": "Cancelar",
    "comments": {
      "add": "Comentar",
      "author": "Autor",
      "body": "Cuerpo",
      "errors": {
        "empty_text": "El comentario no fue guardado, el texto estaba vacío."
      },
      "no_comments_yet": "Aún sin comentarios.",
      "resource": "Recurso",
      "title": "Comentario",
      "title_content": "Comentarios (%{count})"
    },
    "create_model": "Añadir %{model}",
    "dashboard": "Inicio",
    "dashboard_welcome": {
      "call_to_action": "Para agregar secciones edite 'app/admin/dashboard.rb'",
      "welcome": "Bienvenido a Active Admin. Esta es la página de inicio predeterminada."
    },
    "delete": "Eliminar",
    "delete_confirmation": "¿Está seguro de que quiere eliminar esto?",
    "delete_model": "Eliminar %{model}",
    "details": "Detalles de %{model}",
    "devise": {
      "change_password": {
        "submit": "Cambiar mi contraseña",
        "title": "Cambie su contraseña"
      },
      "links": {
        "forgot_your_password": "¿Olvidó su contraseña?",
        "sign_in": "registrarse",
        "sign_in_with_omniauth_provider": "Conéctate con %{provider}"
      },
      "login": {
        "remember_me": "Recordarme",
        "submit": "iniciar sesión",
        "title": "iniciar sesión"
      },
      "reset_password": {
        "submit": "Restablecer mi contraseña",
        "title": "¿Olvidó su contraseña?"
      }
    },
    "download": "Descargar:",
    "edit": "Editar",
    "edit_model": "Editar %{model}",
    "empty": "Vacío",
    "filters": {
      "buttons": {
        "clear": "Quitar Filtros",
        "filter": "Filtrar"
      },
      "predicates": {
        "contains": "Contiene",
        "ends_with": "Termina con",
        "equals": "Igual a",
        "greater_than": "Mayor que",
        "less_than": "Menor que",
        "starts_with": "Empieza con"
      }
    },
    "has_many_delete": "Eliminar",
    "has_many_new": "Agregar Añadir %{model}",
    "has_many_remove": "Quitar",
    "logout": "Salir",
    "main_content": "Por favor implemente %{model}#main_content para mostrar contenido.",
    "new_model": "Añadir %{model}",
    "next": "Siguiente",
    "pagination": {
      "empty": "No se han encontrado %{model}",
      "multiple": "Mostrando %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b> de un total de <b>%{total}</b>",
      "multiple_without_total": "Mostrando %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b>",
      "one": "Mostrando <b>1</b> %{model}",
      "one_page": "Mostrando <b>un total de %{n}</b> %{model}"
    },
    "powered_by": "Powered by %{active_admin} %{version}",
    "previous": "Anterior",
    "sidebars": {
      "filters": "Filtros"
    },
    "update_model": "Editar %{model}",
    "view": "Ver"
  },
  "activemodel": {
    "errors": {
      "format": "%{attribute} %{message}",
      "messages": {
        "accepted": "debe ser aceptado",
        "blank": "no puede estar en blanco",
        "confirmation": "no coincide con la confirmación",
        "empty": "no puede estar vacío",
        "equal_to": "debe ser igual a %{count}",
        "even": "debe ser un número par",
        "exclusion": "está reservado",
        "extension_white_list_error": "No puedes subir este tipo de archivo",
        "greater_than": "debe ser mayor que %{count}",
        "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
        "inclusion": "no está incluído en la lista",
        "invalid": "es inválido",
        "less_than": "debe ser menor que %{count}",
        "less_than_or_equal_to": "debe ser menor o igual que %{count}",
        "not_a_number": "no es un número",
        "not_an_integer": "debe ser un entero",
        "not_found": " no encontrado.",
        "odd": "debe ser un número non",
        "record_invalid": "La validación falló: %{errors}",
        "taken": "ya ha sido tomado",
        "too_long": {
          "one": "es demasiado largo (máximo 1 caracter)",
          "other": "es demasiado largo (máximo %{count} caracteres)"
        },
        "too_short": {
          "one": "es demasiado corto (mínimo 1 caracter)",
          "other": "es demasiado corto (mínimo %{count} caracteres)"
        },
        "wrong_length": {
          "one": "longitud errónea (debe ser de 1 caracter)",
          "other": "longitud errónea (debe ser de %{count} caracteres)"
        }
      },
      "template": {
        "body": "Revise que los siguientes campos sean válidos:",
        "header": {
          "one": "%{model} no pudo guardarse debido a 1 error",
          "other": "%{model} no pudo guardarse debido a %{count} errores"
        }
      }
    }
  },
  "activerecord": {
    "errors": {
      "format": "%{attribute} %{message}",
      "messages": {
        "accepted": "debe ser aceptado",
        "blank": "no puede estar en blanco",
        "confirmation": "no coincide con la confirmación",
        "empty": "no puede estar vacío",
        "equal_to": "debe ser igual a %{count}",
        "even": "debe ser un número par",
        "exclusion": "está reservado",
        "extension_white_list_error": "No puedes subir este tipo de archivo",
        "greater_than": "debe ser mayor que %{count}",
        "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
        "inclusion": "no está incluído en la lista",
        "invalid": "es inválido",
        "less_than": "debe ser menor que %{count}",
        "less_than_or_equal_to": "debe ser menor o igual que %{count}",
        "not_a_number": "no es un número",
        "not_an_integer": "debe ser un entero",
        "not_found": " no encontrado.",
        "odd": "debe ser un número non",
        "record_invalid": "La validación falló: %{errors}",
        "taken": "ya ha sido tomado",
        "too_long": {
          "one": "es demasiado largo (máximo 1 caracter)",
          "other": "es demasiado largo (máximo %{count} caracteres)"
        },
        "too_short": {
          "one": "es demasiado corto (mínimo 1 caracter)",
          "other": "es demasiado corto (mínimo %{count} caracteres)"
        },
        "wrong_length": {
          "one": "longitud errónea (debe ser de 1 caracter)",
          "other": "longitud errónea (debe ser de %{count} caracteres)"
        }
      },
      "template": {
        "body": "Revise que los siguientes campos sean válidos:",
        "header": {
          "one": "%{model} no pudo guardarse debido a 1 error",
          "other": "%{model} no pudo guardarse debido a %{count} errores"
        }
      }
    }
  },
  "activities": {
    "show": {
      "avg": "Promedio:",
      "deliveries": "Entregas",
      "geo_c": "geocode:",
      "lat": "Latitud:",
      "long": "Longitud:",
      "net": "Red:",
      "os": "Sistema operativo:",
      "place": "Lugar:",
      "title": "Título:",
      "title_act": "Tipo de Actividad:",
      "ver": "Versión:",
      "without_act": "sin actividades"
    }
  },
  "admin": {
    "form_for_import_users_to_network": {
      "import": "Importar archivo de usuarios"
    },
    "masive_mailer": {
      "forward": "Reenviar el mensaje a la siguiente cantidad de usuarios con la clave de mensaje",
      "mail": "Se activará el formulario de reenvio cuando la cuenta de mailers masivos se mayor a 0",
      "massive_email": "Enviar mensajes masivos a los siguientes usuarios",
      "send_msg": "Enviar mensajes",
      "text1": "title",
      "text2": "titulo",
      "text3": "message",
      "text4": "number of users when yo want send",
      "text5": "number",
      "text6": "Esta es la clave asignada al mensaje"
    },
    "users": {
      "change_password": {
        "new_pwd": "Nueva contraseña:"
      }
    }
  },
  "ajax_controller": {
    "error1": "Ocurrió un error, porfavor inténtalo de nuevo."
  },
  "assets": {
    "asset_file": {
      "delete": "Borrar"
    },
    "messages": {
      "delete": {
        "error": "Ha ocurrido un error al eliminar el archivo.",
        "non_existent": "El archivo que intentas borrar no existe.",
        "not_an_owner": "No tienes permisos para eliminar este archivo.",
        "success": "Se ha eliminado el archivo."
      }
    },
    "upload_asset_button": {
      "file": "Archivo"
    }
  },
  "assignments": {
    "correct": "Se ha calificado correctamente la tarea.",
    "error": "Ha ocurrido un error al calificar la tarea.",
    "form_for_delivery": {
      "cancel": "Cancelar",
      "descrip": "Descripción:",
      "dlvry": "Entregar Tarea",
      "file_dlvry": "Archivos de entrega:",
      "save_dlvry": "Guardar nueva entrega",
      "title": "Título:"
    },
    "messages": {
      "create": {
        "error": "Ha ocurrido un error al entregar tu tarea",
        "success": "Se ha entregado tu tarea"
      },
      "update": {
        "error": "Ha ocurrido un error al actualizar tu tarea",
        "success": "Se ha actualizado tu tarea",
        "sucess": "Se ha actualizado tu tarea"
      }
    },
    "responce_of_evaluation": {
      "comments": "Comentarios",
      "entry": "Rubro"
    }
  },
  "attributes": {
    "bios": "Biografía",
    "confirmation_token": "El correo electrónico de confirmación",
    "current_password": "Contraseña actual",
    "email": "Correo electrónico",
    "first_name": "Nombre",
    "last_name": "Apellido",
    "personal_url": "Dirección de usuario personalizada"
  },
  "calendar": {
    "index": {
      "back_month": "← Mes anterior",
      "day1": "D",
      "day2": "L",
      "day3": "M",
      "day4": "M",
      "day5": "J",
      "day6": "V",
      "day7": "S",
      "friday": "Viernes",
      "monday": "Lunes",
      "next_month": "Mes siguiente →",
      "saturday": "Sabado",
      "sunday": "Domingo",
      "thursday": "Jueves",
      "tuesday": "Martes",
      "wednesday": "Miercoles"
    }
  },
  "califications": {
    "course": {
      "active_courses": "Centros Emprendedores activos",
      "calification": "Calificación:",
      "criterion": "Criterio",
      "final_score": "Calificación final",
      "no_members": "Este Centros Emprendedor no tiene miembros",
      "no_printable_score": "Tu Líder multiplicador todavia no te ha dado calificación final.",
      "no_score": "Aún no tienes calificación final.",
      "percent": "Porcentaje:",
      "score": "Calificación Obtenida"
    },
    "member": {
      "final_score": "Calificación final:",
      "members": "Miembros",
      "no_score": " Sin Calificar",
      "score": "Calificación Cúrsame:"
    },
    "shared": {
      "califications_course_header": {
        "califications": "Calificaciones"
      },
      "califications_courses_list": {
        "member": "Miembro",
        "members": "Miembros",
        "no_courses": "No hay Centros Emprendedores para ver calificaciones.",
        "select_course": "Selecciona un Centros Emprendedor"
      },
      "califications_header": {
        "active_courses": "Centros Emprendedores activos",
        "califications": "Calificaciones",
        "closed_courses": "Centros Emprendedores finalizados",
        "grades": "Calificaciones"
      }
    }
  },
  "comments": {
    "no_exist": "El comentario que intentas ver no existe o ha sido borrado.",
    "shared": {
      "comment_admin_actions": {
        "confirm": "¿Estas seguro de borrar este comentario?",
        "delete": "Borrar"
      },
      "comment_card": {
        "edit_comment": "Editar Comentario"
      },
      "comment_user_actions": {
        "denounce_comment": "Denunciar comentario"
      }
    }
  },
  "community": {
    "all": {
      "no_records": "No hay más usuarios por mostrar...",
      "no_usr": "No se encontraron usarios en tu red."
    },
    "search": {
      "no_usr": "No se encontraron usarios en tu red.",
      "search": "Búsqueda:"
    },
    "shared": {
      "community_header": {
        "all": "Todos",
        "community": "Red de Emprendedores",
        "students": "Emprendedores",
        "teacher": "Líder multiplicadores"
      },
      "community_paginate_button": {
        "load_more": "Cargar más..."
      },
      "users_search": {
        "find": "Buscar",
        "search_users": "Buscar usuarios..."
      }
    },
    "students": {
      "no_more_usr": "No hay más usuarios por mostrar...",
      "no_students": "Aún no hay emprendedores en tu red."
    },
    "teachers": {
      "no_more_usr": "No hay más usuarios por mostrar...",
      "no_students": "Aún no hay Líderes multiplicadores en tu red."
    }
  },
  "content": {
    "assignments": {
      "adding": {
        "confirm": "¿Eliminar archivo?",
        "confirm1": "¿Eliminar contenido?",
        "delete": "Borrar"
      }
    }
  },
  "course_files": {
    "library_item": {
      "confirm": "¿Estas seguro de querer eliminar este archivo?",
      "delete": "Borrar"
    }
  },
  "courses": {
    "about": {
      "admins": "MEEMS del Centros Emprendedor",
      "course_info": "Información del Centro Emprendedor",
      "info": "Información.",
      "init_date": "Fecha de incio"
    },
    "activities_depot": {
      "act": "Actividades",
      "back_to": "Regresar al Centros Emprendedor",
      "more_act": "Cargar más actividades",
      "select_act": "Selecciona una actividad."
    },
    "all_courses": {
      "no_records": "No hay más Centros Emprendedores para mostrar."
    },
    "clone_course_view": {
      "clone": "Clonar Centros Emprendedor",
      "clone2": "(clonado)",
      "clone_hmwrks": "Selecciona las tareas que quieres clonar para el nuevo Centros Emprendedor.",
      "data_course": "Datos del Centros Emprendedor",
      "dates": "Fechas",
      "delivery_date": "Fecha Entrega",
      "descrip": "Descripción",
      "example": "Ejemplo: Matemáticas I",
      "hmwrks": "Tareas",
      "info_new_course": "Cambia la información para el nuevo Centros Emprendedor.",
      "init_date": "Fecha de inicio",
      "name": "Nombre del",
      "privacy": "Privacidad",
      "private": "Privado",
      "public": "Público",
      "publish_date": "Fecha de publicación"
    },
    "closure": {
      "closure_members": {
        "final_scores": "Calificaciones finales",
        "invite": "Invita a tus emprendedores que se unan a tu Centros Emprendedor.",
        "members": "Miembros",
        "no_members": "No hay miembros en el Centros Emprendedor.",
        "no_score": "Sin calificar",
        "score": "Calificación:",
        "send_scores": "Envia la calificación final a los emprendedores del grupo."
      },
      "user_closure_overview": {
        "calif": "Calificación:",
        "criterium": "Criterio",
        "discuss": "Discusiones",
        "example8": "Ejemplo: 8",
        "final_score": "Calificación Final",
        "hmwrk": "Tareas",
        "members": "Miembros",
        "no_rate": "Sin calificar",
        "of": "de",
        "participate": "Participo en",
        "percent": "Porcentaje:",
        "quest": "Cuestionarios",
        "rate_student": "Calificar emprendedor",
        "respond": "Contesto",
        "score": "Calificación Obtenida",
        "send": "Entrego"
      }
    },
    "courses_search": {
      "courses_search": "Buscar Centros Emprendedor...",
      "search": "Buscar"
    },
    "dashboard_deliver": {
      "access": "Acceso rápido de administración de Centros Emprendedores",
      "activate": "activar Centros Emprendedor",
      "calif": "Calificaciones",
      "count_test": "Contador de examenes respondidos",
      "desactivate": "Desactivar",
      "hmwrks_course": "Tareas en el Centros Emprendedor",
      "inactive": "Inactivo",
      "monitor": "Monitor de actividades"
    },
    "edit": {
      "edit": "Editar Centros Emprendedor"
    },
    "edit_delivery_access": {
      "courses": "Centros Emprendedores",
      "delivery_day": "Ultimo día de entrega",
      "descrip": "Descripción",
      "hmwrk_title": "Titulo de la tarea",
      "publish": "Publicar",
      "publish_date": "Día de pubicación"
    },
    "evaluation": {
      "calif": "Calificación",
      "course_score": "Calificación del Centros Emprendedor",
      "deliver": "Entrega",
      "eval": "% de la Evaluación",
      "exam": "Examen",
      "final": "% Final",
      "hmwrk": "Tarea",
      "items": "Rubros",
      "no_deliver": "Sin entregar",
      "no_group": "No eres parte del grupo!",
      "no_member": "No has sido aceptado en el grupo!",
      "obtained": "Obtenido",
      "pdf": "Descargar (PDF)",
      "percent_obtain": "% obtenido",
      "percent_obtain1": "% Obtenido",
      "score": "Calificacion",
      "student": "Emprendedor:",
      "total_score": "Calificación Total",
      "unresolved": "Sin resolver"
    },
    "evaluation_download": {
      "calif": "Calificación",
      "deliver": "Entrega",
      "eval": "de la Evaluación",
      "eval_percent": "de la Evaluación",
      "exam": "Examen",
      "final": "Final",
      "hmwrk": "Tarea",
      "no_accept": "No has sido aceptado en el grupo!",
      "no_part": "No eres parte del grupo!",
      "not_resolved": "Sin resolver",
      "obtain_percent": "Obtenido",
      "obtain_percent2": "obtenido",
      "ruber": "Rubros",
      "student": "Emprendedor",
      "total_score": "Calificación Total",
      "undelivered": "Sin entregar"
    },
    "evaluation_schema": {
      "add_criterium": "Agregar criterio de evaluación",
      "cancel": "Cancelar",
      "criterium": "Criterio",
      "percent": "Porcentaje",
      "save": "Guardar",
      "text1": "Especifica como quieres evaluar este Centros Emprendedor, puedes agregar nuevos criterios de evaluación o solo dejar los criterios de Cúrsame."
    },
    "form": {
      "add_students": "Inscribe emprendedores a tu Centros Emprendedor.",
      "confirm": "¿Esta seguro que desea eliminar este Centros Emprendedor?",
      "create": "Crear",
      "delete": "Eliminar Centros Emprendedor permanente.",
      "descrip": "Descripción del",
      "descrip2": "Descripción",
      "example": "Ejemplo: Matemáticas I",
      "find_students": "Busca emprendedores para unirlos automaticamente al Centros Emprendedor.",
      "first_name": "Escribe un nombre o apellido.",
      "init_date": "Fecha de inicio",
      "name": "Nombre del",
      "privacy": "Privacidad",
      "private": "Privado",
      "public": "Público",
      "save": "Guardar cambios",
      "students": "Emprendedores",
      "teachers": "Líderes Multiplicadores"
    },
    "form_course": {
      "descrip": "Descripción",
      "init_date": "Fecha inicio",
      "name": "Nombre del",
      "privacy": "Privacidad",
      "private": "Privado",
      "public": "Público",
      "return": "Regresar al",
      "update": "Actualizar"
    },
    "index": {
      "student_courses_index": {
        "no_courses": "No hay Centros Emprendedores.",
        "no_show": "No hay más Centros Emprendedores para mostrar."
      },
      "student_header": {
        "course": "Cursando",
        "courses": "Centros Emprendedores",
        "regist": "Inscríbete",
        "request": "Solicitudes"
      },
      "teacher_courses_index": {
        "no_courses": "No hay Centros Emprendedores.",
        "no_show": "No hay más Centros Emprendedores para mostrar."
      },
      "teacher_header": {
        "active": "Activos",
        "courses": "Centros Emprendedores",
        "create_course": "Crear Centros Emprendedor nuevo",
        "finalize": "Finalizados",
        "new": "Nuevo"
      }
    },
    "library": {
      "biblio": "Biblioteca",
      "file": "Archivo",
      "files": "Archivos",
      "load": "Cargar más archivos",
      "no_files": "Este Centros Emprendedor no tiene archivos en su librería.",
      "text2": "Cúrsame no se hace responsable del contenido subido por los usuarios, ni de cualquier infracción a derechos de autor o de marca por los mismos.  El usuario que ha subido contenido es 100% responsable de él. Cualquier problema de este tipo favor de reportarlo",
      "upload": "Subir archivo"
    },
    "light_box_dashboard_delivery": {
      "criterium": "Criterios de calificación",
      "descrip": "Descripción de entrega",
      "eval": "Seleccione un porcentaje de 1 a 100 para calificar esta tarea",
      "eval_hmwrk": "Calificar tarea",
      "files": "Archivos de la entrega",
      "hmwrk_score": "Calificación de la tarea",
      "percent": "Por favor selecciona un porcentaje de 1 a 100 para calificar esta tarea",
      "score": "Calificación",
      "student": "Emprendedor",
      "title": "Titulo de entrega"
    },
    "members": {
      "mem": "Miembros",
      "no_members": "Centro Emprendedor sin miembros.",
      "no_records": "Este Centros Emprendedor todavia no tiene miembros en el."
    },
    "members_in_courses": {
      "course_view_call": {
        "no_courses": "No hay Centros Emprendedores."
      },
      "owner_partial_for_member": {
        "admin": "MEEMS",
        "student": "Emprendedor",
        "teacher": "Líder multiplicador"
      },
      "permissionings_edit": {
        "confirm": "¿Estás seguro de querer eliminar este usuario del Centros Emprendedor?",
        "delete": "Eliminar",
        "delete_group": "Eliminar del grupo",
        "usr_accept": "Aceptar Usuario"
      }
    },
    "new": {
      "new_course": "Centro Emprendedor nuevo"
    },
    "old_course": {
      "activate": "activar Centros Emprendedor",
      "antique": "Centros Emprendedores antiguos",
      "deactivate": "desactivar Centros Emprendedor"
    },
    "pending": {
      "pending": {
        "no_request": "No hay más solicitudes pendientes."
      }
    },
    "search": {
      "courses_search_results": {
        "no_records": "No se encontraron Centros Emprendedores con el criterio de busqueda.",
        "search": "Busqueda:"
      }
    },
    "shared": {
      "course_card": {
        "member": "Miembro",
        "members": "Miembros"
      },
      "course_card_actions": {
        "active": "Activar",
        "activities_score": "Calificar actividades",
        "clone": "Clonar",
        "confirm": "¿Esta seguro de querer abandonar este Centros Emprendedor?",
        "edit": "Editar",
        "enroll": "Estás inscrito",
        "eval_form": "Forma de evaluación",
        "final_score": "Calificaciones finales",
        "finalize": "Finalizar",
        "leave": "Abandonar Centros Emprendedor",
        "request_send": "Solicitud enviada",
        "send_request": "Enviar solicitud"
      },
      "course_card_post": {
        "new_course": "Nuevo Centros Emprendedor público"
      },
      "course_evaluation_schema_fields": {
        "criterium": "¿Que criterio se evaluará?",
        "discuss": "Discusiones",
        "hmwrks": "Tareas",
        "percent": "Porcentaje asignado",
        "quest": "Cuestionarios"
      },
      "course_header": {
        "active": "Activar",
        "activities_score": "Calificar actividades",
        "clone": "Clonar",
        "edit": "Editar",
        "eval_form": "Forma de evaluación",
        "final": "Finalizar",
        "final_score": "Calificaciones finales",
        "info": "Información",
        "library": "Biblioteca",
        "members": "Miembros",
        "publ": "Publicaciones",
        "update": "Actualizar portada",
        "update_photo": "Actualizar foto"
      },
      "courses_paginate_button": {
        "load_more": "Cargar más..."
      }
    },
    "show": {
      "course-header": {
        "active": "Activar",
        "activities_score": "Calificar actividades",
        "clone": "Clonar",
        "edit": "Editar",
        "eval_form": "Forma de evaluación",
        "final": "Finalizar",
        "final_score": "Calificaciones finales",
        "info": "Información",
        "library": "Biblioteca",
        "members": "Miembros",
        "publ": "Publicaciones",
        "update": "Actualizar portada",
        "update_photo": "Actualizar foto"
      }
    },
    "statics": {
      "active_hmwrk": "TAREAS ACTIVAS",
      "activity": "ACTIVIDADES",
      "discuss": "DISCUSIONES",
      "generate": "Se han generado",
      "in_course": "En el Centros Emprendedor",
      "quest": "CUESTIONARIO",
      "total": "totales"
    },
    "survey_results": {
      "back": "Atras",
      "respose": "Respuesta",
      "result": "Resultado obtenido",
      "student": "Emprendedor"
    },
    "unpublished_courses": {
      "no_courses": "No hay más Centros Emprendedores para mostrar."
    }
  },
  "courses_controller": {
    "active": "se activo correctamente.",
    "clone_correct": "Centro Emprendedor clonado correctamente.",
    "contact": "ha finalizado, contacta al Líder multiplicador para más información.",
    "create": "Se ha creado correctamente tu Centros Emprendedor, edita tu forma de evaluación.",
    "delete": "Centro Emprendedor eliminado correctamente.",
    "ended": "se finalizo correctamente.",
    "has_ended": "ha finalizado, lo puedes activar en el menu de opciones del Centros Emprendedor.",
    "no_accepted": "No has sido aceptado en este Centros Emprendedor.",
    "no_access": "El Centros Emprendedor al que intentas accesar, no existe o ha sido borrado.",
    "no_authorized": "Usted no está autorizado para editar este Centros Emprendedor.",
    "no_exist": "El Centros Emprendedor que intentas ver no existe o ha sido borrado",
    "save": "Se han guardado satisfactoriamente los cambios en el Centros Emprendedor. ",
    "search": "Escribe algo en el campo de busqueda.",
    "success": "Se ha creado correctamente",
    "the_course": "El Centros Emprendedor",
    "your_course": "Tu Centros Emprendedor"
  },
  "date": {
    "abbr_day_names": [
      "dom",
      "lun",
      "mar",
      "mié",
      "jue",
      "vie",
      "sáb"
    ],
    "abbr_month_names": [
      null,
      "ene",
      "feb",
      "mar",
      "abr",
      "may",
      "jun",
      "jul",
      "ago",
      "sep",
      "oct",
      "nov",
      "dic"
    ],
    "day_names": [
      "domingo",
      "lunes",
      "martes",
      "miércoles",
      "jueves",
      "viernes",
      "sábado"
    ],
    "formats": {
      "default": "%d/%m/%Y",
      "long": "%A, %d de %B de %Y",
      "short": "%d de %b"
    },
    "month_names": [
      null,
      "enero",
      "febrero",
      "marzo",
      "abril",
      "mayo",
      "junio",
      "julio",
      "agosto",
      "septiembre",
      "octubre",
      "noviembre",
      "diciembre"
    ],
    "order": [
      "day",
      "month",
      "year"
    ]
  },
  "datetime": {
    "distance_in_words": {
      "about_x_hours": {
        "one": "cerca de 1 hora",
        "other": "cerca de %{count} horas"
      },
      "about_x_months": {
        "one": "cerca de 1 mes",
        "other": "cerca de %{count} meses"
      },
      "about_x_years": {
        "one": "cerca de 1 año",
        "other": "cerca de %{count} años"
      },
      "almost_x_years": {
        "one": "casi 1 año",
        "other": "casi %{count} años"
      },
      "half_a_minute": "medio minuto",
      "less_than_x_minutes": {
        "one": "menos de 1 minuto",
        "other": "menos de %{count} minutos"
      },
      "less_than_x_seconds": {
        "one": "menos de 1 segundo",
        "other": "menos de %{count} segundos"
      },
      "over_x_years": {
        "one": "más de 1 año",
        "other": "más de %{count} años"
      },
      "x_days": {
        "one": "1 día",
        "other": "%{count} días"
      },
      "x_minutes": {
        "one": "1 minuto",
        "other": "%{count} minutos"
      },
      "x_months": {
        "one": "1 mes",
        "other": "%{count} meses"
      },
      "x_seconds": {
        "one": "1 segundo",
        "other": "%{count} segundos"
      }
    },
    "prompts": {
      "day": "Día",
      "hour": "Hora",
      "minute": "Minuto",
      "month": "Mes",
      "second": "Segundos",
      "year": "Año"
    }
  },
  "deliveries": {
    "deliveries_course": {
      "hmwrks": "Tareas para entregar en 3 días o más",
      "hmwrks_last": "tareas pasadas en la sección Pasadas",
      "no_deliver": "Has entregado todas las tareas, puedes ver las",
      "no_hmwrks": "No tienes tareas pendientes por entregar en este Centros Emprendedor.",
      "today_hmwrk": "Tareas para entregar Hoy",
      "tomorrow_hmwrks": "Tareas para entregar Mañana"
    },
    "deliveries_courses_lapsed": {
      "last_hmwrks": "No se encontraron más tareas pasadas."
    },
    "delivery_compart_form": {
      "add_criterium": "Agregar criterio",
      "cancel": "Cancelar",
      "courses": "Centros Emprendedores",
      "criterium": "Criterios a evaluar",
      "dates": "Fechas",
      "deliver_date": "Fecha de entrega",
      "descrip": "Descripción",
      "example": "Ejemplo: Números primos",
      "hmwrk_theme": "Tema de la tarea",
      "integrity": "Por integridad de la actividad no se permiten modificar los archivos, contenidos y criterios después de ser creada le pedimos de la manera mas atenta si necesita agregar alguno de estos elimine la actividad y vuelva a cargarla.",
      "publish": "Publicar",
      "publish_date": "Día de publicación",
      "save": "Guardar Tarea",
      "support": "Material de soporte"
    },
    "index": {
      "deliver_hmwrks": "Tareas para entregar en 3 días o más",
      "hmwrks": "Tareas para entregar Hoy",
      "no_deliver": "Has entregado todas las tareas, puedes ver las",
      "no_hmwrks": "No tienes tarean pendientes por entregar.",
      "past_hmwrks": "tareas pasadas en la sección Pasadas",
      "tomorrow_hmwrks": "Tareas para entregar Mañana"
    },
    "lapsed": {
      "no_hmwrks": "No se encontraron más tareas pasadas."
    },
    "shared": {
      "deliveries_course_header": {
        "active": "Activas",
        "hmwrks": "Tareas",
        "last": "Pasadas"
      },
      "deliveries_filter_course": {
        "filter": "Filtrar: ",
        "select": "Selecciona un Centros Emprendedor"
      },
      "deliveries_header": {
        "deliver": "Entregar",
        "hmwrks": "Tareas",
        "past": "Pasadas"
      },
      "deliveries_paginate_button": {
        "load": "Cargar más..."
      },
      "delivery_card": {
        "edit_hmwrk": "Editar Tarea",
        "hmwrk": "Ver Tarea"
      },
      "delivery_modal": {
        "deliver": "Entregar antes del",
        "deliver_hmwrk": "Entregar Tarea",
        "edit": "Editar Entrega",
        "final_score": "Calificación final obtenida",
        "hmwrk": "Tarea en el Centros Emprendedor",
        "rubre": "Rubro sin comentarios"
      }
    }
  },
  "deliveries_controller": {
    "access_denied": "Estas tratando de ver Tareas de un Centros Emprendedor donde no has sido aceptado.",
    "register": "Estas tratando de ver Tareas de un Centros Emprendedor donde no estas inscrito."
  },
  "devise": {
    "confirmations": {
      "new": {
        "email": "Correo electrónico",
        "email_field": "Por favor, ingresa tu correo en el campo de abajo para dar seguimiento a tu solicitud",
        "forward": "Reenviar instrucciones",
        "no_confirmation": "No has recibido confirmación"
      }
    },
    "mailer": {
      "confirmation_instructions": {
        "push_here": "Si el boton superior no funciona, haz clic aquí",
        "usage": "Para poder utilizar tu cuenta necesitamos que confirmes tu correo electrónico, es muy sencillo: haz click en el siguiente botón y estarás listo para utilizar tu nueva plataforma de estudio.",
        "welcome": "¡Bienvenido a Cúrsame!"
      },
      "reset_password_instructions": {
        "button": "Si el boton superior no funciona, haz clic aquí",
        "pwd": "En caso que no hayas solicitado la restauración de tu contraseña por favor comunicalo a",
        "reset_password": "Nos has indicado que deseas restaurar tu contraseña, para hacerlo solo debes dar click en el botón inferior y seguir las instrucciones.",
        "reset_pwd": "Restaurar contraseña"
      },
      "unlock_instructions": {
        "button": "Si el boton superior no funciona, haz clic aquí",
        "hello": "¡Hola!"
      }
    },
    "passwords": {
      "edit": {
        "ch_pwd": "Cambiar contraseña",
        "change_pwd": "Cambia tu contraseña",
        "confirm_pwd": "Confirmar contraseña",
        "new_pwd": "Nueva contraseña"
      },
      "new": {
        "email": "Ingresa el correo electrónico con el cual te diste de alta y presiona el botón de \"reactivar contraseña\".",
        "email_field": "Correo electrónico",
        "recover_pwd": "Recupera tu contraseña",
        "res_pwd": "Recuperar contraseña"
      }
    },
    "registrations": {
      "edit": {
        "back": "Regresar",
        "cancel_acount": "Cancela tu cuenta",
        "down": "¿Quieres darte de baja?",
        "edit_usr": "Editar Usuario",
        "pwd": "Contraseña",
        "update": "Actualizar"
      },
      "new": {
        "accept": "Acepto los términos y condiciones",
        "access": "Lo sentimos pero la red a la que estas intentado accesar no existe",
        "confirm_pwd": "Confirmacion de contraseña",
        "email": "Correo electrónico",
        "last_name": "Apellidos",
        "name": "Nombre(s)",
        "no_blocked": "¿No recibiste las instrucciones de desbloqueo?",
        "no_confirmation": "¿No recibiste las instrucciones de confirmación?",
        "pwd": "Contraseña",
        "question": "pregunta a un encargado de tu escuela él sabrá ayudarte.",
        "registry": "Registrarme",
        "sign_in": "¿Ya eres usuario? Ingresa",
        "thnx": "¡Gracias!"
      }
    },
    "sessions": {
      "new": {
        "account_window": "te enviará a una pantalla que te pedirá tu email para que te volvamos a enviar los datos de confirmación.",
        "acount": "Confirma tu cuenta",
        "antique_usr": "Soy un usuario antiguo y tengo dudas",
        "change_pwd": "te pedirá que cambies tu contraseña.",
        "close": "Cerrar",
        "confirm": "Esperando confirmación",
        "confirm2": "No me ha llegado el mail de confirmación",
        "confirm3": "Confirmé mi email pero olvide cambiar mi contraseña",
        "email": "Correo electrónico",
        "forgot_pwd": "Olvidé mi contraseña",
        "init": "Ir al inicio",
        "key": "¿Mi clave sigue siendo la misma?",
        "last_user": "Si eras usuario en la plataforma anterior aún sigues siendo usuario en Cúrsame.",
        "link": "Da click en el link",
        "log_in": "Iniciar Sesión",
        "net": "La red a la que estas intentado accesar no existe",
        "net2": "pregunta a un encargado de tu escuela él sabrá ayudarte.",
        "new_pwd": "Se han generado nuevas contraseñas cuando confirmes tu correo electrónico con el mail que enviamos",
        "pwd": "Contraseña",
        "pwd_problem": "Cualquier problema con la contraseña puedes resolverlo dando click en",
        "remember": "Recordarme",
        "s_net": "Clases, Actividades, Red Social.",
        "s_net2": "Cúrsame conecta a directivos, Líderes multiplicadores y emprendedores",
        "s_net3": "permitiéndoles interactuar social y académicamente.",
        "s_netn": "Cúrsame conecta a directivos, Líderes multiplicadores y emprendedores permitiéndoles interactuar social y académicamente",
        "send": "Se ha enviado un correo a",
        "send_pwd": "donde se te enviará un mail para que puedas cambiar tu contraseña.",
        "session": "Inicia sesión",
        "sign_in": "¿Eres nuevo? Regístrate",
        "sorry": "Lo sentimos",
        "user": "¿Soy usuario?"
      }
    },
    "shared": {
      "footer-links": {
        "help": "Centro de ayuda",
        "privacy": "Aviso de privacidad",
        "terms": "Términos y Condiciones"
      },
      "links": {
        "blocked": "¿No recibiste las instrucciones de desbloqueo?",
        "confirm": "¿No recibiste las instrucciones de confirmación?",
        "log_in": "¿Ya eres usuario? Ingresa",
        "pwd": "¿Olvidaste tu contraseña?",
        "sign_in": "¿No estas registrado? Registrate"
      }
    },
    "unlocks": {
      "new": {
        "email": "Correo electrónico",
        "email_req": "Ingresa tu correo en el campo inferior para dar seguimiento a tu solicitud",
        "forward": "Reenviar instrucciones",
        "instruc": "No has recibido instrucciones de desbloqueo"
      }
    }
  },
  "discussions": {
    "correct_edit": "Discusión editada correctamente",
    "create_discuss": "Discusión creada correctamente",
    "discussions_course": {
      "no_discuss": "No se encontraron más discusiones."
    },
    "form_for_discussion": {
      "add_comment": "Agregar criterio",
      "calif": "Calificable",
      "cancel": "Cancelar",
      "create_discuss": "Crear Discusión",
      "criterium": "Criterios a evaluar",
      "dates": "Fechas",
      "deliver_date": "Fecha de entrega",
      "descrip": "Descripción",
      "discuss": "Tema de la discusión",
      "example": "Ejemplo: Números primos",
      "public": "Público",
      "publish_date": "Día de publicación",
      "save_discuss": "Guardar discusión",
      "support": "Material de soporte"
    },
    "index": {
      "no_discuss": "No se encontraron más discusiones."
    },
    "shared": {
      "discussion_card": {
        "edit_discuss": "Editar Discusión",
        "view_discuss": "Ver Discusión"
      },
      "discussion_modal": {
        "criterium": "Criterios a evaluar",
        "grade": "Calificación Obtenida",
        "in_course": "en el Centros Emprendedor",
        "init_discuss": "ha inicidado una discusión"
      },
      "discussions_course_header": {
        "discuss": "Discusiones"
      },
      "discussions_filter_course": {
        "filter": "Filtrar:",
        "select": "Selecciona un Centros Emprendedor"
      },
      "discussions_header": {
        "discuss": "Discusiones"
      },
      "discussions_paginate_button": {
        "load": "Cargar más..."
      }
    }
  },
  "discussions_controller": {
    "delete": "La discusión que intentas ver no existe o ah sido borrada.",
    "no_accepted": "Estas tratando de ver Discusiones de un Centros Emprendedor donde no has sido aceptado.",
    "no_discussion": "No se pudo crear la discusión.",
    "no_register": "Estas tratando de ver Discusiones de un Centros Emprendedor donde no estas inscrito."
  },
  "errors": {
    "format": "%{attribute} %{message}",
    "messages": {
      "accepted": "debe ser aceptado",
      "blank": "no puede estar en blanco",
      "confirmation": "no coincide con la confirmación",
      "empty": "no puede estar vacío",
      "equal_to": "debe ser igual a %{count}",
      "even": "debe ser un número par",
      "exclusion": "está reservado",
      "extension_white_list_error": "No puedes subir este tipo de archivo",
      "greater_than": "debe ser mayor que %{count}",
      "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
      "inclusion": "no está incluído en la lista",
      "invalid": "es inválido",
      "less_than": "debe ser menor que %{count}",
      "less_than_or_equal_to": "debe ser menor o igual que %{count}",
      "not_a_number": "no es un número",
      "not_an_integer": "debe ser un entero",
      "not_found": " no encontrado.",
      "odd": "debe ser un número non",
      "record_invalid": "La validación falló: %{errors}",
      "taken": "ya ha sido tomado",
      "too_long": {
        "one": "es demasiado largo (máximo 1 caracter)",
        "other": "es demasiado largo (máximo %{count} caracteres)"
      },
      "too_short": {
        "one": "es demasiado corto (mínimo 1 caracter)",
        "other": "es demasiado corto (mínimo %{count} caracteres)"
      },
      "wrong_length": {
        "one": "longitud errónea (debe ser de 1 caracter)",
        "other": "longitud errónea (debe ser de %{count} caracteres)"
      }
    },
    "template": {
      "body": "Revise que los siguientes campos sean válidos:",
      "header": {
        "one": "%{model} no pudo guardarse debido a 1 error",
        "other": "%{model} no pudo guardarse debido a %{count} errores"
      }
    }
  },
  "evaluate": {
    "course": {
      "activity": "Actividades para calificar hoy",
      "activity_for_days": "Actividades para calificar en 3 dias o más",
      "activity_for_tmrw": "Actividades para calificar mañana",
      "all": "Todas las actividades de tu Centros Emprendedor estan calificadas, puedes ver",
      "no_activity": "No tienes actividades por calificar.",
      "past_activity": "actividades pasas en la seccion de Pasadas"
    },
    "course_inactive": {
      "enrollment": "Necesitas estar inscrito en al menos un Centros Emprendedor para tener calificaiones.",
      "no_score": "Aún no tienes calificaciones."
    },
    "deliveries": {
      "delivery_user_response": {
        "attachments": "Archivos adjuntos",
        "check_hmwrk": "Calificar tarea",
        "comments": "Envia comentarios en base a los criterios de la actividad.",
        "deliver": "Entrega",
        "deliveries": "Entregas",
        "delivery": "Entregado",
        "example": "Ejemplo",
        "feedback": "Retroalimentación",
        "message": "Mensaje",
        "no_score": "Sin Calificar",
        "score": "Calificación:",
        "scored": "Calificar",
        "student": "Emprendedor",
        "title": "Titulo"
      },
      "evaluate_deliveries": {
        "deliveries": "Entregas",
        "no_deliveries": "Sin Entregas.",
        "no_deliveries_record": "Todavia no hay ninguna entrega en esta tarea.",
        "no_score": "Sin calificar",
        "score": "Calificación:"
      }
    },
    "discussions": {
      "discussion_user_response": {
        "comments": "Comentarios",
        "example": "Ejemplo",
        "feedback": "Retroalimentación",
        "no_score": "Sin Calificar",
        "rate_student": "Calificar emprendedor",
        "score": "Calificación",
        "send": "Envia comentarios en base a los criterios de la actividad."
      },
      "evaluate_discussions": {
        "comment": "Comentario",
        "comments": "Comentarios",
        "discuss": "Discusión",
        "nothing": "Nadie a participado en esta discusión."
      },
      "evaluate_discussions_header": {
        "course": "Centro Emprendedor",
        "limit_publish_date": "Fecha limite para participar",
        "members": "Participantes",
        "publish_date": "Fecha de publicación"
      }
    },
    "inactive": {
      "no_act": "No has creado ninguna actividad.",
      "no_activity": "No tienes actividades pasadas."
    },
    "index": {
      "all": "Todas las actividades de tu Centros Emprendedor están calificadas, puedes ver",
      "no_score": "No tienes actividades por calificar.",
      "past": "actividades pasadas en la sección de Pasadas",
      "someday": "Actividades para calificar en 3 días o más",
      "today": "Actividades para calificar hoy",
      "tomorrow": "Actividades para calificar mañana"
    },
    "shared": {
      "delivery_activity": {
        "delivery": "Entregas",
        "of": "de"
      },
      "discussion_activity": {
        "members": "Participantes",
        "of": "de"
      },
      "discussions_sidebar_responses": {
        "members": "Participantes",
        "no_score": "Sin Calificar"
      },
      "evaluate_course_filter": {
        "all": "Todos los Centros Emprendedores"
      },
      "evaluation_criterium_feedback": {
        "feedback": "Retroalimentación"
      },
      "header_activity_delivery": {
        "course": "Centro Emprendedor",
        "delivery": "Entregas",
        "publish_date": "Fecha de publicación",
        "publish_date_of": "Fecha para entrega"
      },
      "header_activity_survey": {
        "answered": "Contestados",
        "attemps": "Ver los intentos",
        "course": "Centro Emprendedor",
        "deliver_date": "Fecha para entrega",
        "of": "de",
        "publish_date": "Fecha de publicación",
        "the": "del"
      },
      "header_evaluate": {
        "active": "Activas",
        "evaluate": "Calificar Actividades",
        "past": "Pasadas"
      },
      "survey_activity": {
        "answered": "Contestados"
      }
    },
    "survey_attemps": {
      "attemps": "Registro de intentos",
      "new_attemp": "Generar nuevo intento",
      "new_attemp_notice": "Al agregar este intento eliminaras la calificación anterior del cuestionario."
    },
    "surveys": {
      "evaluate_surveys": {
        "delivery": "Entregas",
        "no_answer": "Todavia ningún emprendedor ha contestado este cuestionario.",
        "no_deliveries": "Sin Entregas.",
        "obtain": "Obtenido"
      },
      "survey_user_response": {
        "answers": "Respuestas",
        "comments": "Envia comentarios al emprendedor.",
        "delivery": "Entregas",
        "feedback": "Retroalimentación",
        "obtain": "Obtenido",
        "reply": "Respuesta",
        "send": "Enviar comentario"
      }
    }
  },
  "evaluate_controller": {
    "correct": "Calificación asignada correctamente.",
    "error": "Ha ocurrido un error al calificar la discusión.",
    "no_activity": "Estas tratando de ver una actividad que no te pertenece.",
    "no_calificable": "La discusión que intentas ver no es calificable.",
    "no_evaluate": "Estas tratando de calificar un Centros Emprendedor que no te pertenece.",
    "no_exist": "La discusión que intentas ver no existe o ah sido borrada.",
    "only_teachers": "Estas intentando entrar en una sección solo para Líderes multiplicadores.",
    "send_comment": "Comentario enviado correctamente."
  },
  "evaluation_criteria": {
    "form": {
      "eval": "¿Que criterio se evaluará?"
    },
    "form_course": {
      "eval": "¿Qué se va evaluar?"
    }
  },
  "formtastic": {
    "cancel": "Cancelar",
    "create": "Guardar %{model}",
    "false": "No",
    "required": "requerido",
    "reset": "Restablecer %{model}",
    "submit": "Aceptar",
    "true": "Sí",
    "update": "Guardar %{model}"
  },
  "friendships": {
    "new_friendship": "Has agregado un nuevo amigo",
    "send_friendship": "Se ha enviado una solicitud de amistad"
  },
  "friendships_controller": {
    "delete_usr": "Se ha eliminado al usuario de tus amigos",
    "error_usr": "Error al eliminar al usuario de tus amigos"
  },
  "google_forms": {
    "shared": {
      "card": {
        "edit_form": "Editar Formulario",
        "view_form": "Ver Formulario"
      },
      "dropdown": {
        "courses": "Centros Emprendedores",
        "create_course": "Crear Centro de Emprendedores",
        "dropdown_v": {
          "no_course": "No has creado ningún Centro de Emprendedores"
        },
        "public": "Público",
        "return": "Regresar"
      },
      "form": {
        "cancel": "Cancelar",
        "dates": "Fechas:",
        "deliver_day": "Fecha de entrega",
        "descrip": "Descripción: ",
        "form_descrip": "Descripción del formulario",
        "form_url": "URL del formulario",
        "public": "Público",
        "publish": "Publicar",
        "publish_date": "Día de publicación",
        "roles": "Roles: ",
        "title": "Título: ",
        "title2": "Titulo del formulario"
      },
      "google_form_modal": {
        "in_the_course": " en el curso",
        "the_form": "El formulario ",
        "was_created": " fue creado por"
      }
    },
    "success_form": "Formulario creado exitosamente"
  },
  "groups": {
    "edit": {
      "name": "Nombre",
      "update": "Actualizar"
    },
    "new": {
      "create": "Crear",
      "name": "Nombre"
    }
  },
  "helpers": {
    "select": {
      "prompt": "Por favor selecciona"
    },
    "submit": {
      "create": "Crear %{model}",
      "helpers": null,
      "submit": "Guardar %{model}",
      "update": "Actualizar %{model}"
    }
  },
  "home": {
    "about_us": {
      "about_title": {
        "text1": "Cúrsame es una plataforma educativa  fundada en México a finales de 2011 por un grupo de emprendedores de diversas universidades del país con el objetivo de mejorar la calidad educativa y reducir la brecha digital a través de la tecnología. Durante este periodo hemos logrado beneficiar a más de 100 mil emprendedores, Líderes multiplicadores y directivos tanto de escuelas públicas como privadas en México, con visión de impactar en toda la región y demás países emergentes.",
        "text2": "Hemos recibido 3 rondas de inversión privada por parte de reconocidos fondos, también nos han otorgado una gran cantidad de premios y reconocimientos pero más importante aún, hemos logrado vincularnos con autoridades gubernamentales en proyectos de alto impacto que nos han permitido crecer de una manera bastante acelerada e impactar socialmente.",
        "title": "Acerca de Nosotros"
      },
      "description1_mission": "Mejorar la calidad de la educación en México a través  de una herramienta tecnológica  eficiente que permita  a la red de emprendedores educativa redefinir estrategias de mejora en los procesos de enseñanza-aprendizaje en las que se complementen y favorezcan las dinámicas del aula y puedan ampliarse fuera de la escuela.",
      "description1_objetives": "Contribuir a lograr mejores resultados en el aprendizaje de los emprendedores y en la inclusión digital de líderes multiplicadores, emprendedores y miembros de su familia en México.",
      "description1_philosophy": "En Cúrsame partimos de la concepción de que el aprendizaje  no sólo es construido dentro y por la propia persona, sino que  tiene que ver con aspectos más sociales dentro de Redes de Emprendedores de enseñanza.",
      "description2_mission": "Democratizar el acceso a tecnología educativa de calidad y generar un cambio en la vida diaria y profesional de emprendedores y Líderes multiplicadores al acercarlos a la tecnología y sus beneficios.",
      "description2_objetives": "Promover intercambios de conocimiento  en Redes de Emprendedores de aprendizaje a través de la diversificación de canales de comunicación que facilitan el flujo de información desde el enfoque por competencias.",
      "description2_philosophy": "Para nosotros la posibilidad de interactuar con otros con un fin educativo a través de herramientas tecnológicas es una forma muy eficaz de favorecer los espacios de encuentro efectivo y positivo en el proceso de enseñanza-aprendizaje.",
      "description3_objetives": "Mejorar los tiempos efectivos de clase haciendo más eficiente la gestión  y el seguimiento de actividades educativas.",
      "description4_objetives": "Permitir el acceso a educación de calidad y tecnología educativa a todos las instituciones educativas, sus Líderes multiplicadores y emprendedores sin importar su situación económica y social.",
      "description_vision": "Ser una plataforma líder en el ámbito educativo que  permita a la población mexicana insertarse con éxito en la sociedad de la información y el conocimiento.",
      "mission": "Misión:",
      "objectives": "Objetivos:",
      "our_team": {
        "description": "Cúrsame está conformado por un grupo apasionado de emprendedores, tenemos como meta común generar un impacto positivo en la sociedad a través de la educación y la tecnología.",
        "title": "Nuestro equipo"
      },
      "philosophy": "Filosofía:",
      "vision": "Visión:"
    },
    "apps": {
      "text1": "Descarga nuestras Apps",
      "text2": "No te pierdas ninguna de tus actividades escolares.",
      "text3": "Próximamente"
    },
    "chat": {
      "Centros Emprendedores": "Centros Emprendedores",
      "add_friends": "Agrega a tus amigos en la sección de",
      "community": "Red de Emprendedores",
      "courses": "Centros Emprendedores",
      "create": "Crear Centros Emprendedor ahora →",
      "cursos": "Cursos",
      "friends": "Amigos",
      "no_create": "No has creado ningún Centros Emprendedor todavia.",
      "no_friends": "No tienes amigos.",
      "no_member": "No eres miembro de ningún Centros Emprendedor.",
      "offline_usr": "Usuario desconectado",
      "online_usr": "Usuario conectado",
      "section": "Únete a uno en la sección de"
    },
    "contact": {
      "contact_page": {
        "text1": "Llena el siguiente formulario y nos pondremos en contacto contigo en menos de 48 horas.",
        "text2": "Campos con asterisco",
        "text3": "son requeridos."
      },
      "contact_title": {
        "description": "¿Tienes alguna sugerencia, te gustaría unirte a nuestro equipo o simplemente quieres decir hola? Nos encantaría escucharte.",
        "title": "Contáctanos"
      }
    },
    "delete_publication": "Se ha borrado correctamente la publicación.",
    "demo": "Solictud de demo",
    "edit_comment": "Comentario editado correctamente",
    "features": {
      "features_content": {
        "characteristic_chat": "Algunas de sus características son:",
        "characteristic_comment": "Algunas de sus características son:",
        "characteristic_discussion": "Algunas de sus características son:",
        "characteristic_homework": "Algunas de sus características son:",
        "characteristic_network": "Algunas de sus características son:",
        "characteristic_result": "Algunas de sus características son:",
        "characteristic_statisdic": "Algunas de sus características son:",
        "characteristic_survey": "Algunas de sus características son:",
        "chat": "Chat",
        "comments": "Comentarios",
        "description_chat": "Cada usuario puede utilizar un canal de chat con sus amigos y compañeros. Además cada Centros Emprendedor tiene una sala de chat grupal para compartir contenido en tiempo real.",
        "description_comment": "Permite a todos los miembros de la red de emprendedores comentarse de manera pública, grupal o personal para de esta forma interactuar social o académicamente.",
        "description_discussion": "Los usuarios pueden crear foros de discusión con contenido recomendado y promover la participación de toda la red de emprendedores en el aprendizaje.",
        "description_homework": "Permite a los Líderes multiplicadores crear actividades académicas y a los emprendedores responderlas desde cualquier lugar sin necesidad de utilizar papel y aumentando la productividad de ambos.",
        "description_network": "Todos los usuarios tienen un perfil y pueden ver e interactuar con los de sus amigos promoviendo la interacción social dentro de la institución.",
        "description_result": "Cada usuario puede ver su avance educativo. Los Líderes multiplicadores visualizan los resultados de todos sus emprendedores de una manera muy sencilla y en tiempo real.",
        "description_statisdic": "Los MEEMS de la institución tienen acceso a un panel de estadísticas que les permite conocer lo que está sucediendo dentro del plantel y con esto tomar decisiones importantes con conocimiento de causa.",
        "description_survey": "A través de los cuestionarios los Líderes multiplicadores pueden evaluar a sus emprendedores de manera fácil y automática sin tener que perder tiempo calificando reactivos o desperdiciando papel al imprimir los exámenes.",
        "discussions": "Discusiones",
        "feature1_chat": "Chat individual con amigos y compañeros",
        "feature1_comment": "Públicos o privados",
        "feature1_discussion": "Públicas o privadas",
        "feature1_homework": "Creación a uno o varios Centros Emprendedores",
        "feature1_network": "Encontrar amigos",
        "feature1_result": "Calificaciones por Centros Emprendedor",
        "feature1_statisdic": "Uso de las herramientas de la plataforma",
        "feature1_survey": "Creación en uno o varios Centros Emprendedores",
        "feature2_chat": "Salas de chat grupal por Centros Emprendedor",
        "feature2_comment": "A uno o varios Centros Emprendedores",
        "feature2_discussion": "A uno o varios Centros Emprendedores",
        "feature2_homework": "Fecha límite y hora de entrega",
        "feature2_network": "Encontrar compañeros de clase y Líderes multiplicadores",
        "feature2_result": "Calificaciones individuales",
        "feature2_statisdic": "Ingreso al sistema",
        "feature2_survey": "Fecha y hora límite de entrega",
        "feature3_chat": "Compartir multimedia",
        "feature3_comment": "Contenido enriquecido (multimedia)",
        "feature3_discussion": "Contenido recomendado",
        "feature3_homework": "Archivos adjuntos",
        "feature3_network": "Solicitudes de amistad",
        "feature3_result": "Calificaciones por actividad",
        "feature3_statisdic": "Calificaciones",
        "feature3_survey": "Preguntas y respuestas ilimitadas",
        "feature4_chat": "Mensajes privados",
        "feature4_homework": "Contenido recomendado",
        "feature4_network": "Interacción en perfiles",
        "feature4_result": "Exportar a PDF",
        "feature4_statisdic": "Por Centros Emprendedor",
        "feature4_survey": "Autoevaluación",
        "feature5_homework": "Rubros de evaluación",
        "feature5_statisdic": "Por emprendedor",
        "homeworks": "Tareas",
        "network": "Red de Emprendedores",
        "results": "Calificaciones",
        "statisdics": "Estadísticas:",
        "surveys": "Cuestionarios"
      },
      "features_icons": {
        "chat": "Chat",
        "comments": "Comentarios",
        "discussions": "Discusiones",
        "homeworks": "Tareas",
        "network": "Red de Emprendedores",
        "results": "Calificaciones",
        "statisdics": "Estadisticas",
        "surveys": "Cuestionarios"
      },
      "features_title": {
        "text1": "Ofrecemos herramientas, capacitación y seguimiento a instituciones educativas para mejorar la interacción en el proceso de enseñanza y aprendizaje.",
        "title1": "Metodología"
      },
      "our_methods": {
        "description_endless": "Buscamos siempre estar en contacto con nuestros usuarios para que juntos podamos mejorar la plataforma, conocer sus necesidades y enfocarnos en satisfacerlas para su mayor beneficio.",
        "description_implement": "Tenemos un equipo especializado que está dedicado a visitar los planteles para enseñar a los líderes multiplicadores y directivos toda la funcionalidad de la plataforma y los beneficios que esta conlleva.",
        "description_support": "En Cúrsame estamos cerca de los usuarios de la plataforma para orientarlos y auxiliarlos en caso de que sea necesario. Apoyamos con soporte vía chat, tickets y video tutoriales de uso en todo momento.",
        "description_title": "Nuestra metología toma en cuenta que una plataforma tecnológica por sí misma no es suficiente para satisfacer las necesidades de emprendedores, Líderes multiplicadores y directivos. Por esta razón trabajamos mano a mano con ellos para lograr los mejores resultados.",
        "description_training": "Antes de comenzar a usar Cúrsame capacitamos tecnológicamente a las instituciones que lo requieran. Combatimos así la Brecha Digital y apoyamos a los Líderes multiplicadores en la adopción de las TICs.",
        "endless": "Seguimiento",
        "implement": "Implementación",
        "support": "Soporte",
        "title": "No sólo es la tecnología",
        "training": "Capacitación"
      }
    },
    "help": {
      "help2": "Ayuda",
      "videos": "Video tutoriales en linea."
    },
    "jobs": {
      "job_board": {
        "apply_for_job": "¡Aplicar para esta vacante!",
        "description1_senior_developer": "Para poder seguir ofreciendo la mejor plataforma educativa del mercado a nuestros usuarios e impactar positivamente en la calidad educativa de nuestro país, buscamos tener siempre el mejor equipo de desarrollo.",
        "description2_senior_developer": "Buscamos un perfil con experiencia en manejo de equipos de desarrollo.",
        "implementation": "Implementación",
        "offer1_senior_developer": "+ Sueldo competitivo con el mercado (a negociar).",
        "offer2_senior_developer": "+ Prestaciones de Ley.",
        "offer3_senior_developer": "+ Gran ambiente de trabajo.",
        "offer4_senior_developer": "+ Bonos conforme a resultados.",
        "offer5_senior_developer": "+ Oportunidad de trabajar en una empresa con un potencial de crecimiento enorme y de cambiar la vida de millones de personas.",
        "requeriment1_senior_developer": "+ Al menos 3 años de experiencia en desarrollo de software as a service.",
        "requeriment2_senior_developer": "+ Al menos 2 años de experiencia desarrollando en Ruby, RoR, Phyton o Meteor JS.",
        "requeriment3_senior_developer": "+ Ganas de cambiar el mundo.",
        "requeriments": "Requerimientos:",
        "responsabilities": "Responsabilidades:",
        "responsibility1_senior_developer": "+ Planeación y ejecución del Road Map de desarrollo de la plataforma y nuevos productos.",
        "responsibility2_senior_developer": "+ Establecer metodologías de trabajo ágiles para el equipo de desarrollo.",
        "responsibility3_senior_developer": "+ Organización de los roles trabajo de los miembros del equipo para cubrir las áreas de necesidad.",
        "responsibility4_senior_developer": "+ Participar en la creación de código para el back end de la plataforma.",
        "vacancies": "Vacantes",
        "we_offer": "Ofrecemos:"
      },
      "jobs_title": {
        "text1": "Estamos Transformando la Educación en México.",
        "text2": "¿Te gustaría trabajar con nosotros?",
        "title": "Empleos"
      }
    },
    "landing_page": {
      "cursame_stats": {
        "success_stories_path": "Proyectos",
        "title1": "Usuarios beneficiados",
        "title2": "Instituciones usando Cúrsame",
        "title3": "Actividades en toda la República Mexicana"
      },
      "features_showcase": {
        "features_path": "Conoce nuestra metodología",
        "text1": "Es muy fácil y rápido aprender a utilizar Cúrsame. Gracias a su diseño y funciones fomenta la adopción por parte de los usuarios.",
        "text2": "Nuestras Herramientas aumentan la productividad y reducen la carga de trabajo para Líderes multiplicadores, emprendedores y directivos.",
        "text3": "Cúrsame puede utilizarse desde cualquier computadora o dispositivo móvil, esto permite crear y consultar contenido a cualquier hora y lugar.",
        "title1": "Fácil de usar",
        "title2": "Funciones simples y poderosas",
        "title3": "Multiplataforma"
      },
      "intro_homepage_hidden": {
        "request_demo": "¡Solicita un demo en tu plantel!",
        "text1": "Cúrsame es una plataforma que conecta Líderes multiplicadores, emprendedores y directivos de una misma institución.",
        "title1": "Interactúa social y académicamente mejorando los procesos de aprendizaje y la calidad educativa"
      },
      "social_impact": {
        "description": "Buscamos generar un impacto positivo en la sociedad a través de mejorar la calidad educativa, reducir la brecha digital y detectar oportunamente los focos rojos en Redes de Emprendedores estudiantiles.",
        "header": "Compromiso e impacto social",
        "text1_1": "Seguimiento personalizado del avance educativo de los emprendedores.",
        "text1_2": "Con apoyo de nuestros aliados llevamos servidores y tabletas a las escuelas que más lo necesitan.",
        "text1_3": "A través de diversos indicadores apoyamos en la detección de: Riesgo de deserción escolar.",
        "text2_1": "Entrega contenido especializado de acuerdo a las necesidades individuales.",
        "text2_2": "Apoyamos a los Líderes multiplicadores con capacitación y asesoría tecnológica.",
        "text2_3": "Consumo de sustancias.",
        "text3_1": "Aumenta la productividad y permite potenciar la enseñanza y mejorar el aprendizaje.",
        "text3_2": "La plataforma promueve el intercambio digital de contenido educativo.",
        "text3_3": "\"Bullying” escolar.",
        "title1": "Mejora la calidad educativa",
        "title2": "Reduce la brecha digital",
        "title3": "Detección oportuna de focos rojos"
      },
      "testimonials": {
        "description1": "Cúrsame ha sido una herramienta fundamental en el desarrollo y complemento del día a día en el salón de clases, aumenta el tiempo efectivo en el aula, además nos ayuda a montar programas de lectura y ahorro de papel, lo cual es un gran beneﬁcio.",
        "description2": "He utilizado un sin número de LMS’s, y Cúrsame es la plataforma educativa que mejor se ha adaptado al entorno académico real. Su facilidad de uso y factor social ha provocado que nuestros líderes multiplicadores lo adopten y usen en su trabajo escolar diario beneﬁciando a miles de emprendedores.",
        "description3": "La mejor herramienta para la educación. En nuestra experiencia en Media Superior y Superior hemos tenido  el reto de implementar tecnología para la enseñanza sin haber tenido mucho éxito hasta que comenzamos a trabajar con Cúrsame, los resultados han sido bastante satisfactorios.",
        "header": "Testimoniales",
        "name1": "Lic. Francisco Fabián Brizuela",
        "name2": "Lic. Alejandro Caballero",
        "name3": null,
        "title1": "Director del Centro de Innovación Tecnológica Educativa Secundarias Técnicas Distrito Federal",
        "title2": "Subdirector Académico Universidad Tecnológica Emiliano Zapata",
        "title3": "Asesora en Secretaría de Educación Pública - Subsecretaría de Educación Media Superior"
      },
      "user_roles_types": {
        "description": "Pensamos y diseñamos herramientas para los líderes multiplicadores, emprendedores, directivos y padres de familia de tu red de emprendedores escolar.",
        "header": "Toda tu institución en un sólo lugar",
        "text1": "Toma el control de tu institución con estadísticas en tiempo real y sistemas de comunicación.",
        "text2": "Convierte tus clases en una red de emprendedores de aprendizaje, ahorra tiempo y potencia tus capacidades de enseñanza de una forma social.",
        "text3": "Interactúa con tus compañeros y Líderes multiplicadores. Resuelve tus dudas, aprende y haz tus entregas en cualquier hora y lugar.",
        "text4": "Mantente al día de las actividades y avances escolares de cada uno de tus hijos en tiempo real.",
        "title1": "Directivos",
        "title2": "Líderes multiplicadores",
        "title3": "Emprendedores",
        "title4": "Padres"
      }
    },
    "like": "Me gusta",
    "load_more_notfications": {
      "load_more_notifications": "Ver más notificaciones"
    },
    "login_form": {
      "log_in": "Iniciar Sesión",
      "pwd": "Olvidé mi contraseña",
      "remember": "Recordarme"
    },
    "mkt_pages": {
      "ad01": {
        "form": "Llena el siguiente formulario y nos pondremos en contacto contigo.",
        "text1": "Las demandas profesionales de la economía global y la sociedad de la información requieren del dominio de herramientas socioculturales para interactuar con conocimientos, tales como el lenguaje y la información; al mismo tiempo requieren de las herramientas físicas, tales como las computadoras, móviles y dispositivos con interfaces cada día más complejas. Usar las herramientas de forma interactiva requiere de algo más que el simple acceso a la herramienta y la destreza técnica requerida para manejar la situación. Los emprendedores también necesitan crear y adaptar el conocimiento y las destrezas.",
        "text2": "Hoy se reconoce que las tecnologías de la información y la comunicación ofrecen muchas posibilidades para apoyar los procesos de enseñanza-aprendizaje. Favorecen la motivación, el interés por la materia, la creatividad, la imaginación y los métodos de comunicación, mejoran la capacidad para resolver problemas y el trabajo en grupo, refuerzan la autoestima y permiten mayor autonomía de aprendizaje.",
        "text3": "es una plataforma educativa integral que contribuye a lograr mejores resultados en el aprendizaje de los emprendedores y en la inclusión digital de líderes multiplicadores, emprendedores y miembros de su familia.",
        "text4": "Su principal característica es que retoma aspectos de los Sistemas de Gestión de Aprendizajes (Learning Activity Management System) y de las redes sociales y los integra en una sola plataforma, facilitando los flujos de información, los intercambios de conocimiento y el trabajo colaborativo a través de Redes de Emprendedores de aprendizaje.",
        "tool": "Herramientas del futuro en la educación de hoy"
      },
      "mkt_thanks": {
        "agent": "Uno de nuestros agentes se comunicará contigo lo más pronto posible.",
        "thnks": "¡Gracias por contactarnos!"
      }
    },
    "new_comment": "Se ha creado un comentario",
    "not_found": {
      "not_found2": "Lo sentimos, no encontramos la ruta",
      "return": "Regresar al inicio"
    },
    "press": {
      "text1": "Prensa",
      "text2": "Lo que se dice en medios sobre Cúrsame."
    },
    "privacidad": {
      "best_product": "Mejora del producto.",
      "description1_who_are_we": "Redes Sociales de Aprendizaje SAPI de CV, mejor conocido como Cúrsame",
      "description2_who_are_we": ", con domicilio en",
      "description3_who_are_we": "calle Pomona 7, colonia Roma Norte, ciudad DF, municipio o delegación Cuauhtémoc, c.p. 06100, en la entidad de México DF, país México , y portal de internet",
      "description4_who_are_we": "es el responsable del uso y protección de sus datos personales, y al respecto le informamos lo siguiente:",
      "personal_data1": "¿Para qué fines utilizaremos sus datos personales?",
      "personal_data2": "De manera adicional, utilizaremos su información personal para las siguientes finalidades secundarias que&nbsp;",
      "personal_data3": "no son necesarias",
      "personal_data4": "&nbsp;para el servicio solicitado, pero que nos permiten y facilitan brindarle una mejor atención",
      "personal_data5": "En caso de que no desee que sus datos personales sean tratados para estos fines secundarios, desde este momento usted nos puede comunicar lo anterior a través del siguiente mecanismo",
      "personal_data6": "Para conocer mayor información sobre los términos y condiciones en que serán tratados sus datos personales, como los terceros con quienes compartimos su información personal y la forma en que podrá ejercer sus derechos ARCO, puede consultar el aviso de privacidad integral en",
      "privacy": "¿Dónde puedo consultar el aviso de privacidad integral?",
      "service": "La negativa para el uso de sus datos personales para estas finalidades no podrá ser un motivo para que le neguemos los servicios y productos que solicita o contrata con nosotros.",
      "support": "A través de nuestro soporte en línea o escribiendo a",
      "title": "AVISO DE PRIVACIDAD",
      "who_are_we": "¿Quiénes somos?"
    },
    "request_demo": {
      "text1": "Un asesor especializado visitará tu plantel para demostrar la plataforma y resolver todas tus dudas.",
      "text2": "Llena el siguiente formulario y nos pondremos en contacto contigo en menos de 48 horas.",
      "text3": "Campos con asterisco",
      "text4": "son requeridos.",
      "title": "Solicitar Demo"
    },
    "send": "¡Tu mensaje se ha enviado!",
    "server_error": {
      "conti": "Debido a una contingencia",
      "info": "no es posible mostrar esta información",
      "return": "Regresar al inicio"
    },
    "success_stories": {
      "stories_list": {
        "cobaem": "COBAEM",
        "description_cobaem": "Tras un piloto con 6 planteles del Colegio de Bachilleres de Estado de México, nos encontramos en etapa de expansión y serán 48 planteles en más de 40 municipios de la entidad y 50 mil usuarios los beneficiados por Cúrsame.",
        "description_emprendedores": "Proyecto en conjunto con la Subsecretaría de Educación Media Superior, Angel Ventures y Ashoka. A través de Cúrsame se imparte educación para emprendedores en 100 planteles de preparatoria de todo el país y actualmente en expansión para llegar a 1000 planteles en 2014.",
        "description_pilot_tablets": "Actualmente participamos en la licitación / piloto Federal que se realiza en Morelos, Guanajuato y Querétaro para educación con tabletas en primarias del país. Somos parte de dos de las 5 propuestas finalistas (IUSA y HP).",
        "description_tecnica_df": "Trabajamos con un piloto de 6 planteles tras el cual estamos en proceso de expansión con un universo de 120 planteles  en todo el Distrito Federal.",
        "emprendedores": "Modelo de Emprendedores de Educación Media Superior",
        "pilot_tablets": "Piloto Federal educación con tabletas",
        "schools": "Planteles:",
        "students": "Emprendedores:",
        "teachers": "Líderes multiplicadores:",
        "tecnica_df": "Secundarias Técnicas del DF",
        "testimonial": "Testimonio",
        "testimonial_emprendedores": "“La mejor herramienta para la educación. En nuestra experiencia en Media Superior y Superior hemos tenido  el reto de implementar tecnología para la enseñanza sin haber tenido mucho éxito hasta que comenzamos a trabajar con Cúrsame, los resultados han sido bastante satisfactorios.”",
        "testimonial_emprendedores_name": "Lic. Katia Águila",
        "testimonial_emprendedores_title": "Asesora en Secretaría de Educación Pública - Subsecretaría de Educación Media Superior",
        "testimonial_tecnica_df": "\"Cúrsame ha sido una herramienta fundamental en el desarrollo y complemento del día a día en el salón de clases, aumenta el tiempo efectivo en el aula, además nos ayuda a montar programas de lectura y ahorro de papel, lo cual es un gran beneﬁcio.\"",
        "testimonial_tecnica_df_name": "Lic. Francisco Fabián Brizuela",
        "testimonial_tecnica_df_title": "Director del Centro de Innovación Tecnológica Educativa Secundarias Técnicas Distrito Federal"
      },
      "success_stories_title": {
        "description_success_stories": "Trabajamos con una gran cantidad de instituciones educativas, aquí mostramos algunos de los casos más relevantes.",
        "success_stories": "Proyectos"
      }
    },
    "teacher_day": {
      "happy": "¡Feliz día del Líder multiplicador!",
      "text1": "En Cúrsame estamos muy orgullosos de tí y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text2": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text3": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Líder multiplicador ¡Te lo mereces!"
    },
    "terms_and_conditions": {
      "terms": "Términos y condiciones del sitio",
      "terms1": "Nuestros servicios están disponibles solamente para los individuos y las empresas del marco educativo (que incluyen pero no restringidos a estos, a las de propietario único) en correcta situación legal que puede firmar contratos legalmente obligatorios y se den derecho a suscribir y tener acceso a nuestros servicios bajo la legislación aplicable. Por lo que el cliente garantiza que está bajo la jurisdicción legal del país al que pertenece y bajo la normatividad del mismo. En consecuencia, el cliente garantiza que está autorizado para hacer negocios y está en correcta situación legal en las jurisdicciones en las cuales hace el negocio (durante el término de este acuerdo), que no es un competidor de Cúrsame, y que la persona que acepta este acuerdo tiene por lo menos dieciocho años de la edad y está capacitado y autorizado para asumir las obligaciones contractuales como cliente.",
      "terms10f": "Tipo de indemnización.",
      "terms10x": "Cúrsame solo indemnizara al usuario en especie, no en ninguna forma monetaria, solo mediante la extensión del tiempo que haya sido contratado el servicio, según el tiempo que haya fallado el mismo.",
      "terms1f": "Requerimientos para tener acceso a los Servicios de Cúrsame.",
      "terms2": "Conforme a los términos y condiciones del presente Acuerdo, Cúrsame se compromete a brindar ciertos Servicios al Cliente. Para los efectos del presente Acuerdo: (a) \"Cliente\" (o \"usted\") se refiere al individuo o a la entidad comercial que utiliza o se registró para utilizar dichos Servicios, incluyendo a sus empleados y agentes; (b) \"Servicios\" de Cúrsame se refiere a todos los servicios interactivos o electrónicos ofrecidos por Cúrsame. Cúrsame Online se reserva el derecho de modificar o interrumpir la prestación de sus Servicios en cualquier momento.",
      "terms2f": "Servicios de Cúrsame.",
      "terms3": "Reconoce que el contenido (excepto el que se carga en Cúrsame) de esta página Web, incluyendo pero no limitándose a información, documentos, productos, logotipos, elementos gráficos y sonidos, gui, software y servicios (llamados colectivamente \"Materiales\"), es provisto por Cúrsame o por sus respectivos autores, diseñadores y vendedores (llamados colectivamente \"Proveedores\") y que Cúrsame y/o sus Proveedores se reservan todos los derechos de propiedad inherentes al mismo. Los elementos de la página Web están protegidos por las leyes aplicables al secreto comercial (trade dress) y por otras leyes que no pueden copiarse ni imitarse en su totalidad o en parte. Cúrsame, el logotipo de Cúrsame y otros productos a los que se hace referencia en el presente son marcas de Cúrsame y pueden estar registradas en ciertas jurisdicciones. Cualquier otro nombre de producto, nombre de la empresa, marcas, logotipos y símbolos pueden ser las marcas comerciales de sus propietarios respectivos.",
      "terms3f": "Propiedad",
      "terms4": "El Cliente reconoce y garantiza que la información que proporciona a Cúrsame en los formularios de información de contacto es verdadera, precisa, actual y completa. El Cliente acuerda mantener y actualizar dicha información para asegurar dichas condiciones. En el caso de que dicha información fuera incorrecta, imprecisa, desactualizada o incompleta, Cúrsame tendrá el derecho de suspender o terminar la cuenta del Cliente y el presente acuerdo.",
      "terms4f": "Información del Cliente",
      "terms5": "El Cliente puede designar a personas como sus agentes para que utilicen los Servicios, siempre que cada persona designada tenga la capacidad legal para realizar acuerdos de cumplimiento obligatorio para el Cliente. Además, el Cliente representa y garantiza que cada persona que se registra con la cuenta del Cliente es un agente autorizado del Cliente (un \"Usuario Autorizado\") que tiene dicha capacidad legal.",
      "terms51": "Usuarios autorizados",
      "terms52": "Responsabilidad de Acceso",
      "terms53": "Responsabilidad por los ID y contraseñas del usuario",
      "terms53x": "El Cliente es el único responsable de mantener la confidencialidad de la información de acceso del Cliente, es decir, IDs y contraseñas de acceso a las cuentas de sus Usuarios Autorizados, y es responsable de todas las actividades que ocurren en su cuenta.",
      "terms54": "Notificación de uso no autorizado",
      "terms54x": "El Cliente debe informarle inmediatamente a Cúrsame si nota cualquier actividad que indicara que su cuenta o información está siendo usada sin autorización, incluyendo: (a) El Cliente recibe la confirmación de una o más órdenes realizadas a través de su cuenta que en realidad nunca realizó o cualquier otro informe conflictivo similar; o (b) el Cliente nota el uso no autorizado de cualquier producto o servicio relacionado con su(s) cuenta(s).",
      "terms5f": "Cuenta del Cliente (membresía de Líder multiplicador Cúrsame)",
      "terms5x": "El Cliente es el único responsable del acceso y uso de los Servicios (incluyendo todas las actividades y transacciones) por parte de cualquier Usuario Autorizado y/o ID del Usuario registrado bajo la cuenta del Cliente, a menos que dicho acceso o uso de los Servicios sea resultado directo de negligencia por parte de Cúrsame. Es responsabilidad del Cliente, a través de su Usuario Autorizado que administra sus sistemas, permitir el acceso apropiado a cualquiera de los Usuarios Autorizados del Cliente.",
      "terms61f": "Circunstancias especiales",
      "terms61x": "Cúrsame permitirá el acceso a los Servicios y a la información del Cliente a cualquier agente del Cliente (\"Agente Autorizado\") que presente a Cúrsame una carta notariada firmada por un funcionario del Cliente. Dicha carta deberá incluir declaraciones de autenticidad, autorización, y responsabilidad como lo estipula Cúrsame a su sola discreción. El cliente acuerda de forma expresa e irrevocable que Cúrsame puede confiar en dicha carta y en la autorización aparente de esa persona que solicita el acceso a los Servicios o a la cuenta del Cliente. Cúrsame no será responsable ante el Cliente o cualquier tercero por la veracidad de dicha carta o autoridad.",
      "terms6f": "Información del Cliente",
      "terms6x": "El Cliente es el único responsable por la información que almacena en los servidores de Cúrsame. El Cliente controla su información a través de su enlace generado. Cúrsame recomienda a los Clientes que archiven su información de manera regular y frecuente; el Cliente tiene absoluta responsabilidad de archivar su información y será el único responsable por información perdida o irrecuperable. El Cliente acuerda cumplir con las obligaciones legales concernientes a su información. Cúrsame eliminará información del Cliente una vez finalizado el presente Acuerdo. Sin embargo, Cúrsame puede llegar a retener información del Cliente en sus archivos luego de eliminarlo y no será responsable en lo absoluto por dicha información.",
      "terms7": "Uso aceptable",
      "terms71": "Ilegalidad/ Contenido adulto",
      "terms71f": "Cúrsame sanciona y no permite el contenido del sitio o la transmisión de información que contenga material obsceno o ilegal o fomente o promueva actividad ilegal, incluyendo pero no limitándose a juegos, venta de armas ilegales, y la promoción o publicación de cualquier material que pueda violar la legislación de delitos hostiles.",
      "terms71x": "Cúrsame se reserva el derecho a suspender o rescindir inmediatamente y sin previo aviso cualquier cuenta o transmisión que viole esta política. Asimismo, si el Cliente violara esta política, Cúrsame asistirá y cooperará activamente con las agencias policiales y las autoridades gubernamentales al recolectar y ofrecer información sobre el Cliente, el sitio del Cliente, el contenido obsceno o ilegal, y de aquellas personas que puedan haber accedido, adquirido o utilizado de manera inapropiada contenido obsceno o ilícito.",
      "terms72": "Conducta ilícita",
      "terms72x": "El Cliente no cometerá o permitirá la realización de actos dañinos o ilícitos que justifiquen la acción civil, que incluya pero no se limite a la publicación de información privada, escandalosa o difamatoria acerca de una persona sin su consentimiento o que causare intencionalmente angustia emocional.",
      "terms73": "Se prohíben estrictamente las violaciones o intentos de violaciones de los sistemas de Cúrsame, o la interrupción de sus servicios. Dicha violación puede resultar en responsabilidad civil y penal. Sin limitación, los ejemplos de violaciones del sistema incluyen",
      "terms73f": "Acceso e interferencia",
      "terms73x": "Acceso sin autorización o uso de los Servicios de Cúrsame, incluyendo cualquier intento de sondeo, copia o prueba de vulnerabilidad de un sistema o la violación de medidas de seguridad o autenticación sin autorización expresa de Cúrsame; o b) Interferencia con el Servicio a cualquier cliente o sistema, incluyendo, sin limitación, congestión o intento deliberado de sobrecargar un sistema y ataques explícitos; o c) Utilización de cualquier dispositivo, software, o rutina que interfiera o intente interferir con el correcto funcionamiento de los Servicios; o d) Cualquier acción que imponga una carga desproporcionada o inmoderada para la infraestructura de Cúrsame",
      "terms73x1": "El Cliente no deberá desarmar, desmontar, decodificar, extraer, revertir la ingeniería o de otra forma intentar derivar el código fuente del \"software\" (incluyendo los dispositivos, métodos, procesos, e infraestructura) que sustentan los Servicios o cualquier otro software en el sitio Web de Cúrsame. 8.4 Violación de derecho de autor o marca registrada Los Servicios de Cúrsame se pueden utilizar únicamente con propósitos legales. Se prohíbe la transmisión, distribución o almacenamiento de cualquier material en violación a cualquier ley vigente o regulación, incluyendo la exportación de leyes de control. Esto incluye, sin limitación, material protegido por patente, derecho de autor, marca registrada, marca identificada de servicios, secreto de fabricación, u otros derechos de propiedad intelectual. Si utiliza material de terceros, deberá obtener autorización previa. Al utilizar los Servicios, usted representa y garantiza ser el autor y dueño de derechos de autor y/o titular de la licencia con respecto a cualquier contenido alojado y, asimismo, representa y garantiza que ningún contenido viola la marca registrada o los derechos de terceros. Cúrsame se reserva el derecho de suspender o rescindir la(s) transmisión(es) que, a su criterio, violan estas políticas o violan alguna ley o regulación.",
      "terms75": "Mal uso de los reCentros Emprendedores del sistema",
      "terms75f": "El Cliente no deberá hacer mal uso de los reCentros Emprendedores, que incluyan pero que no se limiten a, empleo del contenido que consume excesivo tiempo en el CPU o espacio de almacenamiento; utilización excesiva de la banda ancha; o reventa del acceso al contenido alojado en los servidores de Cúrsame.",
      "terms76": "Otras actividades",
      "terms76f": "Ya sea lícito o ilícito, Cúrsame se reserva el derecho a determinar qué es perjudicial para sus Clientes, operaciones o reputación, incluyendo actividades que restrinjan o inhiban a algún otro usuario del uso o placer de disfrutar el Servicio o Internet.",
      "terms76x": "Por favor, sea consciente que Cúrsame se reserva el derecho de supervisar, suspender, restringir, suprimir, modificar, o terminar cualquier contenido o transmisión de la cuenta que se considere viola cualquiera de las políticas anteriormente dichas. Si se da el caso, Cúrsame formulará las denuncias pertinentes a las autoridades responsables de la aplicación de la ley, y en tal caso, Cúrsame ayudará activamente a las entidades responsables de aplicar la ley y con la investigación y el proceso de cualquier actividad, incluyendo la entrega de las cuentas de los clientes y de sus datos personales.",
      "terms76x1": "Las quejas sobre violadores de nuestra Política deben enviarse por correo electrónico a politicasvioladas@cursa.me . Se investigará cada queja y puede resultar en la inmediata cancelación de los Servicios, sin previo aviso.",
      "terms7ax": "cargar, publicar, enviar por correo electrónico, transmitir u ofrecer de otra manera cualquier Contenido que propague mensajes de terror o describa tortura o muerte; si es un caso muy serio, se informará a la autoridad legal competente y/o se contactará al correspondiente proveedor de Internet;",
      "terms7bx": "perjudicar a menores, esto incluye cualquier forma de pornografía infantil; si es un caso muy serio, se informará del contenido a la autoridad legal competente y/o se contactará al correspondiente proveedor de Internet; se prohibe publicar cualquier tipo de pornografía.",
      "terms7cx": "cargar, publicar, enviar por correo electrónico u ofrecer de otra manera cualquier Contenido que viole la patente, marca registrada, secreto de fabricación, derecho de autor u otros derechos propietarios de cualquier parte.",
      "terms7dx": "Envío masivo de correo no solicitado (\"Spam\"). Se prohíbe el envío de cualquier forma de Spam a través de los servidores de Cúrsame. Asimismo, también se prohíbe el uso de cualquier reCentros Emprendedor de el sitio web de Cúrsame para el envío de Spam de otro proveedor de servicio, anuncio de un sitio Web, o dirección de correo. Las cuentas o los servicios de Cúrsame no pueden ser usados para solicitar información/respuestas de los clientes, mediante mensajes enviados desde otro ISP (Proveedor de Servicios de Internet) donde esos mensajes puedan violar esta política de uso o la del otro proveedor.",
      "terms7ex": "El anuncio, transmisión, o cualquier otra manera de hacer accesible, o el uso de cualquier programa, producto o servicio que esté diseñado para violar los términos y las condiciones de este acuerdo o del uso aceptable de este u otro ISP, incluyendo, aunque de forma no limitada a, facilitar los medios de envío de Spam, iniciación de operaciones de ping, avalancha, bombardeo de correo, o negación de ataques al servicio;",
      "terms7fx": "Reenvío a usuarios de Internet de cualquier sitio web que, si ese sitio web contase con soporte de Cúrsame, supondría la violación de los términos de este acuerdo;",
      "terms7gx": "proveer anonimato a actividades ilegales, fraudulentas o que violen los derechos de propiedad intelectual de una tercera parte;",
      "terms7hx": "conociendo o deliberadamente permitiendo a otros el uso de los servicios de Cúrsame: (i) para cualquier actividad ilegal, invasiva, fraudulenta, difamatoria, o con propósito fraudulento; (ii) para alterar, robar, corromper, inhabilitar, destruir, violar o penetrar en cualquier sistema de seguridad o cifrado de cualquier fichero electrónico, base de datos o red; (iii) para materialmente interferir el uso de la red de Cúrsame de otros clientes o usuarios autorizados; (iv) en violación de las políticas de uso aceptable aplicables al uso de los proveedores de servicios nucleares de Cúrsame, y considerando que usted está avisado de tales políticas o tales políticas está disponibles en lugares públicos de los sitios web de tales proveedores; o (v) de manera que, en opinión de Cúrsame, es contraria a las reglas generalmente aceptadas de etiqueta y de la buena conducta en Internet;",
      "terms7ix": "intentar obtener acceso a otra cuenta o Centros Emprendedor de otro ordenador de propiedad ajena sin autorización del legítimo dueño (por ejemplo \"hacking\");",
      "terms7jx": "obtener o intentar servicios por otros medios o usando dispositivos con la intención de intentar no pagar;",
      "terms7kx": "participar en actividades diseñadas para molestar o que puedan suponer la negación del servicio (por ejemplo ataques sincronizados) a otros usuarios, ya sea en la red de Cúrsame o en la de cualquier otro ISP (Proveedor de Servicios de Internet);",
      "terms7lx": "interferir con el uso o disfrute de la red Cúrsame u otros servicios por parte de otros clientes o usuarios autorizados, incluyendo el uso excesivo de los servicios impidiendo el uso equitativo por parte de otros usuarios de Cúrsame.",
      "terms7mx": "exponer a los proveedores, representantes, directivos, empleados, agentes, asociados o accionistas de Cúrsame a escrutinio público, ridículo o difamación;",
      "terms7nx": "suplantar a cualquier persona o entidad, incluyendo, aunque sin limitarse a ellos, a representantes de Cúrsame, así como falsamente afirmar o inducir a interpretaciones erróneas sobre su personalidad o afiliación a personas o entidades;",
      "terms7ox": "importar de forma paralela cualquier copia de obras con derechos de propiedad intelectual protegida con el objeto de venderla, alquilarla, etc. por provecho, recompensa y/o.",
      "terms7px": "importar o poseer cualquier importación paralela de copias de obras con derechos de propiedad intelectual protegidas, tales como, películas, series de televisión o grabaciones musicales para su reproducción o visionado público, incluyendo, aunque sin limitación, locales de karaoke, restaurantes, tiendas, etc.",
      "terms7x": "Usted acuerda no utilizar los servicios de Cúrsame para",
      "terms8": "Limitación de la responsabilidad",
      "terms8x": "Usted usa Cúrsame bajo su propia responsabilidad. Si usted no está satisfecho con cualquier aspecto de nuestro servicio o con estos términos y condiciones, o algunas otras reglas o políticas, su única solución es finalizar el uso del servicio. Usted explícitamente entiende y acepta que Cúrsame no será responsable por cualquier daño directo, daños accidentales indirectos, fortuitos, especiales, consecuentes, incluyendo pero no limitados a, los daños por la pérdida de beneficios, buena voluntad, uso, datos u otras pérdidas intangibles (incluso si le hemos advertido sobre la posibilidad de tales daños), resultando de: (a) el uso o la incapacidad para utilizar el servicio; (b) el coste de obtención mercancías o servicios alternativos resultado de cualquier mercancía, dato, información comprados o obtenidos o mensajes recibidos o transacciones realizadas en o mediante este servicio; (c) acceso desautorizado a o alteración de sus transmisiones o datos; (d) declaraciones o actuaciones de cualquier tercer parte en el servicio; o (e) cualquier otra asunto relativo al servicio.",
      "terms9f": "Limitación de la responsabilidad de protección a contenidos.",
      "terms9x": "xCúrsame no indemnizará al usuario en fallo del sistema, perdida de su información, jaqueo, destrucción de su información voluntariamente, intento de daño de otro usuario, uso de su información para daño físico, uso de su información para daño moral, uso de su información para cualquier tipo de violación a la ley. No nos hacemos responsables del uso que se le dé a sus contenidos en la red."
    },
    "thnx": "Gracias por usar Cúrsame.",
    "unlike": "Ya no me gusta",
    "wall": {
      "comment": "Comentar"
    }
  },
  "layouts": {
    "sessions": {
      "help": "Ayuda"
    },
    "static_pages": {
      "first_column": {
        "title1": "Cúrsame",
        "title10": "Blog",
        "title2": "Metodología",
        "title3": "Proyectos",
        "title4": "Nosotros",
        "title5": "Prensa",
        "title6": "Empleos",
        "title7": "Contacto",
        "title8": "Solicitar Demo",
        "title9": "Aplicaciones"
      },
      "fourth_column": {
        "title1": "Derechos reservados © 2014 Cúrsame",
        "title2": "Ver la página en ingles"
      },
      "second_column": {
        "title1": "Ayuda",
        "title2": "Centro de ayuda",
        "title3": "Aviso de Privacidad",
        "title4": "Términos y Condiciones"
      },
      "third_column": {
        "title1": "Síguenos en"
      }
    },
    "super_admin": {
      "activities": "Actividades",
      "admin": "administración",
      "admin_net": "Administrar redes",
      "course_admin": "MEEMS de Centros Emprendedores",
      "hello": "hola",
      "statics": "Estadísticas",
      "super_adm": "Super admins",
      "usr": "Usuarios"
    }
  },
  "libraries": {
    "new": {
      "new_library": "Nueva Biblioteca"
    },
    "shared": {
      "card": {
        "view_files": "Ver Archivos"
      },
      "header": {
        "create_folder": "Crear Carpeta",
        "library": "Biblioteca",
        "upload_file": "Subir Archivo"
      },
      "library_files": {
        "no_documents": "No hay documentos."
      }
    }
  },
  "library_directories": {
    "shared": {
      "form": {
        "descrip": "Descripción: ",
        "lib_descrip": "Descripción de la biblioteca",
        "lib_name": "Titulo de la biblioteca",
        "name": "Nombre: ",
        "send": "Enviar"
      },
      "header": {
        "create_folder": "Crear Carpeta",
        "library": "Biblioteca",
        "upload_file": "Subir Archivo"
      },
      "list": {
        "no_documents": "No hay documentos."
      },
      "standalone_card": {
        "open_folder": "Abrir Carpeta"
      }
    }
  },
  "library_files": {
    "new": {
      "upload_file": "Subir Archivo"
    },
    "shared": {
      "card": {
        "download_file": "Descargar Archivo"
      },
      "form": {
        "descrip": "Descripción: ",
        "descrip_file": "Descripción del Archivo",
        "file": "Archivo",
        "file_name": "Titulo del Archivo: ",
        "file_name2": "Titulo del Archivo",
        "send": "Enviar"
      },
      "standalone_card": {
        "download_file": "Descargar Archivo"
      }
    }
  },
  "managers": {
    "bit": {
      "error_connection": "Ocurrio un error, no se pudo acceder a la información de bit",
      "error_course": "Ocurrio un error al crear el curso.",
      "error_user": "No se pudo guardar a el usuario: ",
      "success_importing_group": "Grupo importado correctamente, Se ha creado el curso."
    },
    "comments": {
      "index": {
        "actions": "Acciones",
        "comment": "Comentario",
        "comment_in": "Comentario en",
        "comments1": "Comentarios",
        "confirm": "Estas seguro de borrar este comentario.",
        "course": "Centro Emprendedor",
        "create_date": "Fecha de creación",
        "delete": "Borrar",
        "discuss": "Discusión",
        "hmwrk": "Tarea",
        "like": "Me gusta",
        "no_user": "No tiene usuario",
        "public": "Publico",
        "quest": "Cuestionario",
        "user": "Usuario",
        "view": "Ver"
      },
      "show": {
        "author": "Autor",
        "back": "← Regresar",
        "comment": "Comentario",
        "comment_in": "Comentario en",
        "confirm": "Estas seguro de borrar este comentario.",
        "course": "Centro Emprendedor",
        "create_date": "Fecha de Creación",
        "delete": "Borrar",
        "discuss": "Discusión",
        "hmwrk": "Tarea",
        "like": "Me Gusta",
        "public": "Publico",
        "quest": "Cuestionario",
        "user": "Usuario"
      }
    },
    "correct_course": "Centro Emprendedor creado correctamente",
    "correct_deleted": "Comentario borrado correctamente",
    "course_delete": "Centro Emprendedor borrado correctamente.",
    "course_error1": "Ocurrio un error al crear el Centros Emprendedor",
    "course_error2": "Ocurrio un error al crear el Centros Emprendedor",
    "course_error3": "Ocurrio un error al editar el Centros Emprendedor",
    "course_error4": "Ocurrio un error al borrar el Centros Emprendedor",
    "courses": {
      "edit": {
        "edit1": "Editar Centro Emprendedor"
      },
      "index": {
        "actions": "Acciones",
        "courses": "Centros Emprendedores",
        "create": "Crear Centros Emprendedor",
        "delete": "Borrar",
        "edit": "Editar",
        "inte_date": "Fecha de creación",
        "name": "Nombre",
        "students": "Emprendedores",
        "sure": "Estas seguro de borrar este Centros Emprendedor.",
        "teachers": "Líder multiplicadores"
      },
      "new": {
        "create_course": "Crear Centro Emprendedor"
      },
      "shared": {
        "form": {
          "add": "Agrega Líderes multiplicadores al Centros Emprendedor.",
          "cancel": "Cancelar",
          "create": "Crear Centro Emprendedor",
          "descrip": "Descripción",
          "enroll": "Inscribe emprendedores a tu Centros Emprendedor.",
          "example": "Ejemplo",
          "example2": "Matemáticas I",
          "find": "Busca Líderes multiplicadores para administrar el Centros Emprendedor.",
          "find2": "Busca emprendedores para unirlos automaticamente al Centros Emprendedor.",
          "init_date": "Fecha de Inicio",
          "init_date2": "Fecha inicio",
          "last_name": "Escribe un nombre o apellido.",
          "name": "Nombre",
          "privacy": "Privacidad",
          "private": "Privado",
          "public": "Público",
          "save": "Guardar cambios",
          "students": "Emprendedores",
          "teachers": "Líder multiplicadores",
          "write_name": "Escribe un nombre o apellido."
        },
        "managers_courses_subnav": {
          "list": "Listado"
        }
      },
      "show": {
        "comments": "Comentarios",
        "create_date": "Fecha de Creación",
        "delete": "Borrar",
        "descrip": "Descripción",
        "edit": "Editar",
        "files": "Archivos",
        "hmwrks": "Tareas",
        "quest": "Cuestionarios",
        "return": "← Regresar",
        "students": "Emprendedores",
        "sure": "Estas seguro de borrar este Centros Emprendedor.",
        "teachers": "Líderes Multiplicadores"
      }
    },
    "create": "Usuario creado correctamente.",
    "delete_content": "El contenido fue borrado correctamente.",
    "delete_discuss": "Discusión borrada correctamente.",
    "delete_error": "Ocurrió un error al borrar el comentario",
    "delete_report": "El reporte fue borrado correctamente.",
    "delete_success_usr": "Usuario borrado correctamente",
    "delete_test": "Cuestionario borrado correctamente.",
    "deliveries": {
      "index": {
        "actions": "Acciones",
        "course": "Centro Emprendedor",
        "delete": "Borrar",
        "end_date": "Fecha de finalización",
        "hmwrks": "Tareas",
        "init_date": "Fecha de creación",
        "name": "Nombre",
        "no_user": "No tiene usuario",
        "published": "Publicada",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta tarea.",
        "unpublished": "Sin Publicar",
        "user": "Usuario",
        "view": "Ver"
      },
      "show": {
        "course": "Centro Emprendedor",
        "delete": "Borrar",
        "descrip": "Descripción",
        "end_date": "Fecha de finalización",
        "init_date": "Fecha de Creación",
        "published": "Publicada",
        "return": "← Regresar",
        "state": "Estado",
        "sure": "Estas seguro de borrar este cuestionario.",
        "teacher": "Líder multiplicador",
        "unpublished": "Sin Publicar"
      }
    },
    "discussions": {
      "index": {
        "actions": "Acciones",
        "course": "Centro Emprendedor",
        "delete": "Borrar",
        "discuss": "Discusiones",
        "eval": "Evaluable",
        "init_date": "Fecha de creación",
        "name": "Nombre",
        "non_eval": "No Evaluable",
        "published": "Publicada",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta discusión.",
        "type": "Tipo",
        "unpublished": "Sin Publicar",
        "view": "Ver"
      },
      "show": {
        "course": "Centro Emprendedor",
        "delete": "Borrar",
        "descrip": "Descripción",
        "eval": "Evaluable",
        "init_date": "Fecha de Creación",
        "non_eval": "No Evaluable",
        "public": "Publica",
        "published": "Publicada",
        "return": "← Regresar",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta discusión.",
        "teacher": "Líder multiplicador",
        "type": "Tipo",
        "unpublished": "Sin Publicar"
      }
    },
    "edit_correct": "Centro Emprendedor editado correctamente",
    "edit_error": "Error al editar el usuario",
    "error_delete_user": "Error al borrar el usuario",
    "error_user": "Ocurrio un error al crear el usuario",
    "file": "Tipo de archivo no soportado",
    "hmwrk_delete": "Tarea borrada correctamente.",
    "import_members": {
      "course": "Course",
      "download": "Descargar archivo de Centros Emprendedores",
      "import1": "Importar miembros",
      "import2": "Importa los miembros de los Centros Emprendedores desde una base de datos.",
      "import3": "Importar lista de usuarios",
      "import4": "¿Importar?",
      "list": "Lista donde se puede importar.",
      "no_file": "NO SE ENCONTRO EL ARCHIVO",
      "text1": "Es importante tomar en cuenta que el formato del archivo es fundamental para importar correctamente los Centros Emprendedores.",
      "text2": "Propietario solo puede ser 0 o 1, donde 0 es para referirse a que aquel usuario sera el dueño del Centros Emprendedor mientras que 1 es para especificar que solo es un miembro del Centros Emprendedor nada más.",
      "text3": "El Email debe de ser el correo asociado al usuario."
    },
    "index": {
      "actual": "Actual",
      "comments": "Comentarios",
      "courses": "Centros Emprendedores",
      "discuss": "Discusiones",
      "exams": "Examenes",
      "hmwrks": "Tareas",
      "pop": "Población esperada",
      "stat": "Estadisticas",
      "usr": "Usuarios"
    },
    "mailer": {
      "example": "Ejemplo",
      "example2": "Ceremonia de clausura",
      "masive": "Mail Masivo",
      "masive2": "Envía un mail a todos los miembros de tu red de emprendedores.",
      "msg": "Mensaje",
      "send": "Enviar",
      "subject": "Asunto"
    },
    "menu": {
      "admin": "Administración",
      "config": "Configuración",
      "import_cur": "Importar Centros Emprendedores",
      "import_std": "Importar emprendedores de Centros Emprendedor",
      "import_usr": "Importar usuarios",
      "masive": "Correo Masivo",
      "usr": "Usuarios"
    },
    "no_delete": "No puedes borrar este usuario.",
    "no_edit": "No puedes editar ese usuario.",
    "proc_file": "Tu archivo esta siendo procesado, recibiras un correo electrónico de confirmación",
    "reported_contents": {
      "index": {
        "actions": "Acciones",
        "author": "Autor",
        "delete_content": "Borrar Contenido",
        "delete_report": "Borrar Reporte",
        "report_content": "Contenidos Reportados",
        "report_date": "Fecha de reporte",
        "sure": "¿Está seguro de borrar este contenido?",
        "sure2": "¿Está seguro de borrar este reporte?, el contenido no será borrado.",
        "usr": "Usuario",
        "view": "Ver"
      }
    },
    "settings": {
      "config": "Configuración"
    },
    "shared": {
      "managers_sidebar": {
        "comments": "Comentarios",
        "config": "Configuración",
        "courses": "Centros Emprendedores",
        "discuss": "Discusiones",
        "hmwrk": "Tareas",
        "masive": "Correo Masivo",
        "quest": "Cuestionarios",
        "report_content": "Contenido Reportado",
        "stat": "Estadisticas",
        "usr": "Usuarios"
      },
      "managers_user_header": {
        "admin": "MEEMS",
        "edit": "Editar perfil",
        "exit": "Salir del administrador",
        "help": "Ayuda",
        "log_out": "Cerrar sesión"
      }
    },
    "success_usr": "Usuario editado correctamente",
    "surveys": {
      "index": {
        "actions": "Acciones",
        "course": "Centro Emprendedor",
        "delete": "Borrar",
        "end_date": "Fecha de finalización",
        "init_date": "Fecha de creación",
        "name": "Nombre",
        "no_user": "No tiene usuario",
        "published": "Publicada",
        "quest": "Cuestionarios",
        "state": "Estado",
        "sure": "Estas seguro de borrar este cuestionario.",
        "unpublished": "Sin Publicar",
        "user": "Usuario",
        "view": "Ver"
      },
      "show": {
        "course": "Centro Emprendedor",
        "delete": "Borrar",
        "end_date": "Fecha de finalización",
        "init_date": "Fecha de creación",
        "return": "← Regresar",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta tarea.",
        "teacher": "Líder multiplicador"
      }
    },
    "users": {
      "edit": {
        "edit1": "Editar Usuario"
      },
      "import": {
        "download": "Descargar archivo de usuarios",
        "import2": "Importar Usuarios",
        "import3": "Importa los usuarios de tu red de emprendedores desde una base de datos.",
        "import4": "Es importante tomar en cuenta que el formato del archivo es fundamental para importar correctamente los usuarios.",
        "import5": "Importar archivo de usuarios",
        "no_find": "NO SE ENCONTRO UN ARCHIVO",
        "text1": "El role puede ser Emprendedor o Líder multiplicador.",
        "text2": "El email debe de ser el email del usuario."
      },
      "index": {
        "actions": "Acciones",
        "create": "Crear usuario",
        "delete": "Borrar",
        "edit": "Editar",
        "email": "Correo electrónico",
        "enroll": "Fecha de registro",
        "name": "Nombre",
        "sure": "Estas seguro de borrar este usuario.",
        "type": "Tipo de usuario",
        "usr": "Usuarios",
        "view": "Ver"
      },
      "new": {
        "create": "Crear Usuario"
      },
      "shared": {
        "form": {
          "admin": "MEEMS",
          "cancel": "Cancelar",
          "create": "Crear Usuario",
          "email": "Correo electrónico",
          "last_names": "Apellidos",
          "name": "Nombre(s)",
          "pwd": "Contraseña",
          "save": "Guardar cambios",
          "student": "Emprendedor",
          "teacher": "Líder multiplicador",
          "type": "Tipo de usuario"
        },
        "managers_users_subnav": {
          "import": "Importar",
          "list": "Listado"
        }
      },
      "show": {
        "bio": "Biografia",
        "delete": "Borrar",
        "deliveries": "Tareas entregadas",
        "edit": "Editar",
        "email": "Correo electrónico",
        "eval": "Participación en discusiones evaluables",
        "info": "Si información",
        "last": "Ultimo inicio de sesión",
        "quest": "Cuestionarios contestados",
        "return": "← Regresar",
        "sure": "Estas seguro de borrar este usuario.",
        "type": "Tipo de usuario"
      }
    }
  },
  "managers_controller": {
    "in_stack": "Su correo se ha puesto en cola para enviar."
  },
  "members_in_courses": {
    "create": {
      "enrolled": "Te has inscrito",
      "request_send": "Solicitud enviada"
    }
  },
  "messages": {
    "index": {
      "no_member": "No eres parte del grupo!",
      "send": "Enviar Mensaje"
    }
  },
  "messages_controller": {
    "no_send": "No puedes enviar correo a los emprendedores del Centros Emprendedor"
  },
  "modal": {
    "delivery_modal": {
      "hmwrk_not_found": "La tarea que tratas de ver ya no existe, ponte en contacto con el Operador de los Centros de Emprendedores."
    },
    "discussion_modal": {
      "discussion_not_found": "La discusión que tratas de ver ya no existe, ponte en contacto con el Operador de los Centros de Emprendedores."
    },
    "google_form_modal": {
      "form_not_found": "El formulario que tratas de ver ya no existe, ponte en contacto con el Operador de los Centros de Emprendedores."
    },
    "reported_content_modal": {
      "publ_not_found": "La publicación que tratas de denunciar ya no existe."
    },
    "survey_modal": {
      "no_modal_found": "El cuestionario que tratas de ver ya no existe, ponte en contacto con el Operador de los Centros de Emprendedores."
    }
  },
  "networks": {
    "alertmethod": {
      "net": "Ir a la red a la que pertenezco",
      "text1": "Se ha encontrado que usted no es miembro de la red a al que intenta acceder, lo redireccionaremos a una red de la cual usted sea miembro, después de esto usted deberá loguearse."
    },
    "awaiting_confirmation": {
      "email": "Revisa tu correo electrónico",
      "log_in": "Inicia sesión",
      "send": "Se han enviado las instrucciones para activar tu cuenta."
    },
    "create": "Se ha creado una red.",
    "form": {
      "api_key": "API Key:",
      "authorization_keyword": "Palabra clave",
      "example": "Ejemplo: ",
      "form": "Habilitar formulario de registro publico.",
      "icon": "Imagen de inicio de sesión",
      "icon2": "Logo de la institución",
      "label": "Etiquetas",
      "msg": "Mensaje de bienvenida",
      "name": "Nombre",
      "net_evaluable": "Habilitar evaluables de la red. (Tareas, Cuestionarios y Discusiones evaluables)",
      "pop": "Población",
      "pwd": "Reestablecer contraseña al importar los usuarios",
      "save": "Guardar cambios",
      "subdomain": "Subdominio"
    },
    "index": {
      "new": "Nueva red"
    },
    "messages": {
      "search": {
        "network": "Buscador de Redes"
      },
      "update": {
        "success": "Configuración guardada correctamente."
      }
    },
    "network_mask": {
      "enroll": "Registrar usuario"
    },
    "new": {
      "new_net": "Crear nueva red"
    }
  },
  "networks_users": {
    "index": {
      "no_members": "no hay miembros en esta red",
      "records": "Usuarios registrados en el sistema"
    },
    "new": {
      "accept": "Acepto las normas y condiciones de esta plataforma",
      "select": "Selecciona un rol",
      "sign_in": "Ingresar a la plataforma",
      "suscribe": "suscribirme a la red"
    }
  },
  "notifier": {
    "accepted_message": {
      "accept": "Has sido aceptado en el Centros Emprendedor",
      "button": "Si el botón superior no funciona, haz click aquí",
      "hello": "¡Hola"
    },
    "csv_import_email": {
      "error": "¡Error!",
      "hello": "¡Hola",
      "results": "Te anexamos los resultados de la importación de usuarios",
      "success": "Exito"
    },
    "masive_mailer_for_super_admin": {
      "user": "Estimados usuarios de Cúrsame"
    },
    "new_delivey_notification": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "course_notif": "Tarea en el Centros Emprendedor",
      "deliver": "Entregar antes del"
    },
    "new_discussion_notification": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "discuss": "Discusión en el Centros Emprendedor"
    },
    "new_member_in_course": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "course": "Desea formar parte de tú Centros Emprendedor"
    },
    "new_survey_notification": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "deliver": "Entregar antes del",
      "hmwrk": "Tarea en el Centros Emprendedor"
    },
    "send_comment_on_course": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "comment": "comentó en un comentario en el Centros Emprendedor",
      "comment2": "comentó en el Centros Emprendedor"
    },
    "send_contact_mail": {
      "contact": "Contacto Normal",
      "demo": "Solicitud de Demo",
      "ext": "Extensión",
      "msg": "Mensaje",
      "name": "Nombre",
      "other": "Otro",
      "pos": "Posicion",
      "school": "Escuela",
      "tel": "Telefono"
    },
    "send_email": {
      "msg": "Mensaje del MEEMS de la red",
      "net": "Ir a la red"
    },
    "send_email_members_in_course": {
      "net": "Ir a la red",
      "notif": "Notificación"
    },
    "send_import_courses": {
      "error": "Error",
      "line": "Linea",
      "no_error": "No hubo errores"
    },
    "send_import_members": {
      "course": "Centro Emprendedor",
      "error": "Error",
      "line": "Linea",
      "no_error": "No hubo errores"
    },
    "send_import_users": {
      "error": "Error",
      "line": "Linea"
    },
    "user_mailer_with_password": {
      "accept": "has sido aceptado aceptado en Cúrsame.",
      "active": "Activado",
      "hello": "Hola",
      "net": "Ir a la red",
      "text1": "puedes cambiarla al iniciar sessión.",
      "text2": "Si no puedes ver este mail,",
      "text3": "haz click aquí.",
      "text4": "¡Feliz día del Líder multiplicador!",
      "text5": "En Cúrsame estamos muy orgullosos de tí y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text6": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text7": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Líder multiplicador ¡Te lo mereces!",
      "welcome": "Bienvenido",
      "your_pwd": "Tu constraseña es"
    }
  },
  "number": {
    "currency": {
      "format": {
        "delimiter": ",",
        "format": "%u%n",
        "precision": 2,
        "separator": ".",
        "significant": false,
        "strip_insignificant_zeros": false,
        "unit": "$"
      }
    },
    "format": {
      "delimiter": ",",
      "precision": 2,
      "separator": ".",
      "significant": false,
      "strip_insignificant_zeros": false
    },
    "human": {
      "decimal_units": {
        "format": "%n %u",
        "units": {
          "billion": "mil millones",
          "million": "millón",
          "quadrillion": "mil billones",
          "thousand": "mil",
          "trillion": "billón",
          "unit": ""
        }
      },
      "format": {
        "delimiter": ",",
        "precision": 3,
        "significant": true,
        "strip_insignificant_zeros": true
      },
      "storage_units": {
        "format": "%n %u",
        "units": {
          "byte": {
            "one": "Byte",
            "other": "Bytes"
          },
          "gb": "GB",
          "kb": "KB",
          "mb": "MB",
          "tb": "TB"
        }
      }
    },
    "percentage": {
      "format": {
        "delimiter": ","
      }
    },
    "precision": {
      "format": {
        "delimiter": ","
      }
    }
  },
  "polls": {
    "answer_fields": {
      "answer": "Ingresar respuesta",
      "correct": "¿Es la respuesta correcta?",
      "delete": "Eliminar"
    },
    "edit": {
      "edit": "Editando Encuesta"
    },
    "index": {
      "list": "Lista de Encuestas"
    },
    "question_fields": {
      "add": "Agregar Respuesta",
      "delete": "Eliminar",
      "quest": "Ingresar pregunta"
    }
  },
  "publications": {
    "discussion_template": {
      "discuss": "ha inicidado una discusión",
      "in_course": "en el Centros Emprendedor"
    }
  },
  "registrations": {
    "edit": {
      "bios": "Biografía",
      "cancel": "Cancelar mi cuenta",
      "cancel2": "Cancelar",
      "confirm": "¿Estas seguro de que quieres darte de baja de Cúrsame?",
      "dir": "Dirección",
      "down": "¿Quieres darte de baja?",
      "edit": "Editar Perfil",
      "email": "Correo electrónico",
      "example": "Ejemplo",
      "last_name": "Apellido",
      "name": "Nombre",
      "pwd": "Escribe tu contraseña para guardar",
      "text1": "Recuerda no colocar espacios ni simbolos como",
      "text2": "ya que no se aceptará tu url",
      "update": "Actualizar perfil"
    },
    "edit_user": {
      "back": "Regresar",
      "cancel": "Cancela tu cuenta",
      "down": "¿Quieres darte de baja?",
      "edit": "Editar Usuario",
      "update": "Actualizar"
    },
    "new": {
      "accept": "Acepto los",
      "confirm_pwd": "Confirmar contraseña",
      "confirm_pwd2": "Confirmacion de contraseña",
      "email": "Correo electrónico",
      "last_name": "Apellidos:",
      "name": "Nombre(s)",
      "pwd": "Contraseña",
      "sign_in": "Registrarme",
      "student": "Regístrate Emprendedor",
      "teacher": "Regístrate Líder multiplicador",
      "terms": "Términos y Condiciones",
      "text1": "Lo sentimos pero la red a la que estas intentado no permite el registro público. pregunta a un encargado de tu escuela él sabrá ayudarte.",
      "text2": "Ir a la página principal",
      "type": "Tipo de usuario"
    },
    "send_confirmation": {
      "send_confirmation": "Se envio la confirmacion"
    }
  },
  "registrations_controller": {
    "error": "El perfil no pudo actualizarce correctamente",
    "update": "Se a actualizado correctamente tu perfil"
  },
  "reported_contents": {
    "denounce_fail": "Algo sucedió que no se pudo guardar tu denuncia.",
    "denounce_success": "Tu denuncia ha sido realizada con éxito.",
    "shared": {
      "reported_content_modal": {
        "comment": "Escribe un comentario",
        "help_us": "Ayúdanos a entender qué sucede",
        "reported_content": "Ya has reportado este contenido, el MEEMS de la red tomará acciones.",
        "send": "Enviar",
        "why_no_content": "¿Por qué no quieres ver este contenido?"
      }
    }
  },
  "shared": {
    "assets_for_assignments": {
      "new_assets": {
        "attach_file": "Adjuntar archivo"
      }
    },
    "assets_form": {
      "new_assets": {
        "file": "Archivo"
      }
    },
    "chat": {
      "add_message_form": {
        "msg": "Escribe un mensaje y presiona Enter."
      },
      "chat": {
        "more_msg": "Cargar más mensajes...",
        "select": "Selecciona a un amigo o Centro Emprendedor para enviar mensaje."
      },
      "load_more_messages": {
        "more_msg": "Cargar más mensajes..."
      },
      "message_notifications": {
        "ago": "Hace",
        "all_msg": "Ver todos los mensajes",
        "msg": "Mensajes"
      },
      "message_tpl": {
        "ago": "hace"
      }
    },
    "comment": {
      "comment_main": {
        "like": "me gusta"
      }
    },
    "comment_form": {
      "file": "Archivo",
      "new_publication": {
        "cancel": "Cancelar",
        "comment": "Comentar",
        "file": "Archivo",
        "public": "Público",
        "save": "Guardar"
      }
    },
    "comments": {
      "publication_box": {
        "more_comments": "cargas mas comentarios",
        "twlv_likes": "12 Likes",
        "twty_comments": "20 Comentarios"
      }
    },
    "course_joyride": {
      "joyRideTipContent": {
        "content_area": "Esta es el área de creación de contenido.",
        "course_descrip": "Aquí va la descripción del Centro Emprendedor.",
        "course_edit": "Editar el Centro Emprendedor",
        "create_content": "Creación de contenido",
        "descrip": "Descripción",
        "ed_course": "Aquí puedes editar el Centro Emprendedor.",
        "edit_course": "Editar el Centro Emprendedor",
        "friends": "Amigos",
        "friends_list": "Aquí encontrarás un listado de tus amigos",
        "notif": "Notificaciones",
        "notif_area": "Esta es el área de notificaciones.",
        "profile": "Perfil",
        "pub_area": "Aquí encontrarás todas las publicaciones de la red.",
        "publications": "Publicaciones",
        "sub_profile": "Este es el perfil del Centro Emprendedor.",
        "subtitle": "En este lugar podrás ver todo lo que pasa en el Centro Emprendedor.",
        "text_edit_course": "Aqui puedes editar el Centro Emprendedor.",
        "welcome": "Bienvenido al perfil de Centro Emprendedor"
      }
    },
    "delivery_publication_tpl": {
      "category": "rubro",
      "edit_delivery": "Editar Entrega",
      "end_delivery": "Entregar antes de",
      "evaluates": "Se evalua",
      "files": "Archivos",
      "final_eval": "Evaluación final",
      "no_evaluation": "A esta tarea no se le han asignado áreas de evaluación",
      "no_reply": "No se han encontrado respuestas a esta tarea",
      "reply": "Responder",
      "view_delivery": "Ver entrega de tarea"
    },
    "dropdown": {
      "dropdown_v": {
        "courses": "Centros Emprendedores",
        "goto_section": "Únete a uno en la sección de",
        "new_course": "Crear Centro Emprendedor ahora →",
        "no_course": "No has creado ningún Centro Emprendedor todavia.",
        "no_member": "No eres miembro de ningún Centro Emprendedor.",
        "public": "Público",
        "return": "Volver"
      },
      "return": "Volver"
    },
    "evaluation_criteria": {
      "evaluation_criteria_fields": {
        "criteria_name": "Nombre del criterio a evaluar"
      }
    },
    "form_commentable": {
      "comment": "Comentar",
      "comment_2": "Comentar",
      "write_comment": "Escribe un comentario"
    },
    "network_joyride": {
      "joyride_tip_content": {
        "courses": "Creación de Centros Emprendedores",
        "description": "En este tour te mostraremos el nuevo diseño y las herramientas que podras utilizar dentro de nuestra plataforma.",
        "description_courses": "Al dar click en el botón Crear (+) aparecera el formulario de creación para los Centros Emprendedores que impartes.",
        "menu": "Menú de creación",
        "menu_description": "En un solo lugar puedes crear Comentarios, Tareas, Discusiones y Cuestionarios.",
        "text1": "Público o a tus Centros Emprendedores",
        "text10": "En esta sección podrás ver a tus amigos, o ingresar a la \"Red de Emprendedores\" para agregarlos",
        "text11": "Menú interactivo",
        "text12": "Dependiendo la sección en la que te encuentres este menú mostrará herramientas de utilidad.",
        "text13": "Video tutoriales de ayuda",
        "text14": "En cada sección donde veas un signo de interrogación \"?\", al dar click en el podras ver un video sobre como usar dicha función.",
        "text2": "Podrás escoger si tus publicaciones son públicas para toda la red o para uno o varios de tus Centros Emprendedores.",
        "text3": "Uno o varios Centros Emprendedores",
        "text4": "!Tendrás la posibilidad de escoger si lo que creas pertenece a uno, varios o todos los Centros Emprendedores! .",
        "text5": "Muro principal",
        "text6": "En el muro principal aparecerán todas las publicaciones de tus Centros Emprendedores y amigos.",
        "text7": "Filtrado de publiciones",
        "text8": "Con el menu de filtrado podrás escoger que tipo de publicación quieres ver en el muro.",
        "text9": "Amigos",
        "welcome": "Bienvenido a Cúrsame"
      }
    },
    "notification_type": {
      "activity_feed": {
        "accept_course": "Has sido aceptado en el Centro Emprendedor",
        "active": "activado",
        "activities_p_user": "Una actividad por",
        "add_to_course": "ha solicitado entrar al Centro Emprendedor",
        "comment_course": "comentó en el Centro Emprendedor",
        "comment_net": "comentó en la red",
        "comment_profile": "ha comentado en tu perfil.",
        "comment_to_comment": "ha comentado en un comentario que hiciste.",
        "comment_to_homework": "ha comentado en la tarea",
        "course_calif": "Se ha calificado el Centro Emprendedor",
        "course_expired": "ha llegado a su fecha final. Por favor desactívalo.",
        "coursework": "del Centro Emprendedor",
        "discuss_comment": "comentó en tu discusión",
        "ended": "finalizado",
        "friend_notif": "ha solicitado ser su amigo",
        "friend_req": "ha aceptado su solicitud de amistad.",
        "homework_calif": "Han calificado tu tarea",
        "in_course": "en tu Centro Emprendedor",
        "in_course1": "en tu Centro Emprendedor",
        "in_course2": "en tu Centro Emprendedor",
        "in_network": "en tu red",
        "lookup_usr": "Ver usuario",
        "new_course": "Nuevo Centro Emprendedor",
        "new_discus": "Nueva discusion",
        "new_homework": "Nueva tarea",
        "new_question": "Nuevo cuestionario",
        "one_usr": "Un usuario",
        "quest_feedback": "Has recibido retroalimentación en el cuestionario",
        "quest_response": "ha respondido el cuestionario",
        "response_homework": "ha respondido la tarea",
        "text15": "El Centro Emprendedor",
        "text16": "ha sido",
        "text17": "Han calificado tu participacion en la discusión",
        "the_course": "El Centro Emprendedor",
        "view_usr": "Ver usuario"
      }
    },
    "notifications": {
      "box_notifications": {
        "more_notif": "Ver más notificaciones",
        "no_notif": "No hay notificaciones para mostrar.",
        "notif": "Notificaciones"
      }
    },
    "post_comments": {
      "comment": "Comentar",
      "comment1": "Comentar",
      "delte": "Borrar",
      "last_comments": "Ver comentarios anteriores",
      "like": "me gusta",
      "write_comment": "Escribe un comentario"
    },
    "post_menu": {
      "comment": "Comentario",
      "discussion": "Discusión",
      "form": "Formulario",
      "homework": "Tarea",
      "post_comment": "Deja un comentario.",
      "questionnaire": "Cuestionario",
      "what_are_y_think": "¿Qué estás pensando?"
    },
    "posts": {
      "post_admin_actions": {
        "confirm_delete": "¿Estás seguro de borrar esto?",
        "delete": "Borrar",
        "edit": "Editar"
      },
      "post_child_comment": {
        "like": "Me gusta",
        "not_like": "Ya no me gusta"
      },
      "post_comments": {
        "comment": "Comentar",
        "delete": "Borrar",
        "like": "me gusta",
        "view_comments": "Ver comentarios anteriores",
        "write_comment": "Escribe un comentario"
      },
      "post_comments_list": {
        "non_commentable": "Esta publicación ya no se puede comentar.",
        "prev_comments": "Comentarios anteriores",
        "write_comment": "Escribe un comentario"
      },
      "post_meta_data": {
        "like": "Me gusta",
        "not_like": "Ya no me gusta"
      },
      "post_people_who_liked": {
        "ed": "A",
        "liked": "les gusta esto"
      }
    },
    "publications": {
      "comment": {
        "course_comment": "comentó en el Centro Emprendedor",
        "profile_comment": "comentó en el perfil de",
        "usr": "Usuario"
      },
      "course": {
        "go_course": "Ir al Centro Emprendedor",
        "new_course": "Nuevo Centro Emprendedor público"
      },
      "delivery": {
        "delivery_txt": "Entregar antes del",
        "new_homework": "Nueva tarea para entregar en el Centro Emprendedor",
        "open_hmwk": "Abrir tarea"
      },
      "discussion": {
        "in_course": "en el Centro Emprendedor",
        "new": "Nueva discusión",
        "open_discuss": "Abrir discusion"
      },
      "meta_data": {
        "ago": "Hace",
        "at": "a las",
        "comments": "Comentarios",
        "like": "Me gusta"
      },
      "owner_edit_publications": {
        "confirm": "¿Estas seguro de borrar esto?",
        "delete": "Borrar",
        "edit": "Editar"
      },
      "people_who_likes": {
        "users": "Usuarios a los que les gusta esto"
      },
      "publication_comments": {
        "prev_comments": "Ver comentarios anteriores"
      },
      "publication_template": {
        "edit_publ": "Editar publicación"
      },
      "survey": {
        "new_quest": "Nuevo cuestionario para responder en el Centro Emprendedor",
        "open_quest": "Abrir cuestionario",
        "question": "Pregunta",
        "questions": "Preguntas",
        "response_before": "Responder antes del"
      }
    },
    "publications_filter": {
      "filter_by_course_publications": {
        "filtrate": "Filtrar",
        "select_course": "Selecciona un Centro Emprendedor"
      }
    },
    "sessions": {
      "network_box_head": {
        "log_in": "¿Ya eres usuario? Ingresa →",
        "sign_in": "Registrarme →"
      },
      "network_not_exist": {
        "no_net_exists": "Parece que la red a la que quieres accesar no existe. Pregunta a un encargado de tu escuela él sabrá ayudarte.",
        "no_network": "No ingresaste el subdominio de la red a la que quieres acceder.",
        "ops": "¡Oops!",
        "search_school": "Busca tu escuela aquí →"
      }
    },
    "sidebar": {
      "sidebar_section": {
        "activities": "Actividades",
        "add_friends": "Agrega a tus amigos en la sección de",
        "calendar": "Calendario",
        "chat": "Chat",
        "community": "Red de Emprendedores",
        "community_href": "Red de Emprendedores",
        "course_href": "Centros Emprendedores",
        "course_message": "Únete a uno en la sección de",
        "courses": "Centros Emprendedores",
        "discussion": "Discusiones",
        "disp_usr": "Usuario conectado",
        "friends": "Amigos",
        "goto_section": "Únete a uno en la sección de",
        "homework": "Tareas",
        "initiation": "Inicio",
        "library": "Biblioteca",
        "no_course": "No has creado ningún Centro Emprendedor.",
        "no_course_href": "Crear Centro Emprendedor ahora →",
        "no_disp_usr": "Usuario desconectado",
        "no_friends": "No tienes amigos.",
        "no_member": "No eres miembro de ningún Centro Emprendedor.",
        "questionnaire": "Cuestionarios",
        "radar": "Radar",
        "ratings": "Calificaciones",
        "return": "volver",
        "vLex": "vLex"
      },
      "upcomming_deliveries_widget": {
        "side_section": {
          "pending_homeworks": "Tareas próximas"
        }
      },
      "upcomming_surveys_widget": {
        "side_section": {
          "next_questionnaires": "Cuestionarios próximos"
        }
      }
    },
    "static_pages": {
      "header": {
        "notif": "Oops! al parecer tu correo no pertenece a niguna red.",
        "search_network": "Busca tu red",
        "text1": "¿Ya eres usuario?",
        "text2": "Encuentra tu red",
        "text3": "Escribe tu correo electrónico para accesar a la red de tu institución.",
        "title1": "Metodologías",
        "title2": "Proyectos",
        "title3": "Nosotros",
        "title4": "Empleos",
        "title5": "Contacto"
      }
    },
    "survey_publication_tpl": {
      "respond_quest": "Cuestionario respondido"
    },
    "tour": {
      "survey_first_login": {
        "priv": "Aviso de Privacidad",
        "quest": "Enviar Encuesta",
        "text4": "Tus datos son confidenciales y serán utilizados con el fin de",
        "text5": "mejorar nuestro servicio, Revisa nuestro",
        "thnx": "Gracias.",
        "title": "Ayúdanos a mejorar",
        "title2": "Para Cúrsame es muy importante su participación, a continuación se le presentan algunas preguntas que nos permitirán mejorar continuamente y ofrecer una herramienta congruente con sus necesidades.",
        "title3": "Para Cúrsame es muy importante tu participación, a continuación se te presentan algunas preguntas que nos permitirán conocerte mejor. Tus respuestas son confidenciales y se usaran con el fin de mejorar continuamente."
      },
      "video_tour_first_time": {
        "loading_tour": "Cargando tour...",
        "wel_text": "Por favor mira con atención este tour inicial para que conozcas las principales secciones de la nueva plataforma.",
        "wel_text1": "En este pequeño video de introducción te mostramos las principales secciones de tu perfil y el de tus amigos.",
        "wel_text2": "En este video de introducción te mostramos las principales secciones y características del Centro Emprendedor.",
        "welcome": "Bienvenido al nuevo Cúrsame"
      }
    },
    "user_header": {
      "activity_block": {
        "admin_href": "Administración",
        "edit_profile_href": "Editar perfil",
        "profile_href": "Ir a mi perfil",
        "sign_out_href": "Cerrar sesión"
      },
      "activity_notifications": {
        "help": "Ayuda"
      }
    },
    "user_joyride": {
      "content": "Creación de contenido",
      "content_area": "Esta es el area de creación de contenido.",
      "courses": "Centros Emprendedores",
      "courses_area": "Esta es el area de tus Centros Emprendedores.",
      "edit_prof": "Editar perfil",
      "friends": "Amigos",
      "friends_list": "Aqui encontraras un listado de tus amigos",
      "notif": "Notificaciones",
      "prof": "Perfil",
      "prof_photo": "Aqui ver la foto de tu perfil.",
      "publ": "Publiciones",
      "publ_area": "Aqui encontraras todas las publicaciones de la red.",
      "text_edit_prof": "Aqui puedes editar tu perfil.",
      "text_notif": "Esta es el area de notificaciones.",
      "text_prof": "En este lugar podrás ver todo lo que pasa en tu red cursame.",
      "welcome_prof": "Bienvenido a tu perfil"
    },
    "wall_filters": {
      "all": "Todos",
      "comments": "Comentarios",
      "courses": "Centros Emprendedores",
      "discuss": "Discusiones",
      "homework": "Tareas",
      "quest": "Cuestionarios"
    },
    "website": {
      "cta_request_demo": {
        "request_demo": "¡Solicita un demo en tu plantel!"
      },
      "other_contact_ways": {
        "follow_us_on_facebook": "Síguenos en Facebook",
        "follow_us_on_twitter": "Síguenos en Twitter",
        "text1": "Otras formas de contacto"
      }
    }
  },
  "superadmin": {
    "activities": {
      "activities": "Las actividades del sistema están geo localizadas",
      "activity": "Actividad por",
      "avg": "Promedio de calificación por tareas",
      "avg2": "Promedio de calificación por survey",
      "avg3": "Promedio de calificación por usuario",
      "avg4": "Promedio",
      "comments": "Comentarios",
      "courses": "Centros Emprendedores",
      "exam": "Exámenes",
      "exam_delivery": "Entregas de examenes",
      "find": "Buscar Actividades por usuario o titulo",
      "goto": "Ir a la actividad",
      "hmwrks": "Tareas",
      "hmwrks_delivery": "Entregas de tareas",
      "lat": "Latitud",
      "long": "Longitud",
      "net": "Red",
      "no_act": "sin actividades",
      "os": "Sistema operativo",
      "place": "Lugar",
      "sys": "Actividades del sistema",
      "title": "Título",
      "type": "Tipo de Actividad",
      "ver": "Versión"
    },
    "courses_sintetic_view_and_edit": {
      "courses": "Visor de Centros Emprendedores",
      "hmwrks": "Tareas",
      "hmwrks_delivery": "Entregas de tarea",
      "quest": "Cuestionarios",
      "show": "Muestra los Centros Emprendedores de las redes, sus miembros y sus actividades",
      "show2": "Mostrar tareas",
      "show3": "Mostrar cuestionarios",
      "show4": "Mostrar estadísticas del Centros Emprendedor",
      "show5": "Ver entregas",
      "stat": "Estadísticas"
    },
    "create_super_admin": {
      "enroll": "Registrar usuario",
      "img": "Puedes ver las instrucciones de creación de super admin accediendo al código qr",
      "superuser": "Super MEEMS Cúrsame"
    },
    "instructions": {
      "create": "Instrucciones para creación de súper MEEMS",
      "link": "Crea coloca tu nombre, apellido, email y contraseña, da click en continuar y listo"
    },
    "networks": {
      "admin": "Administrar networks",
      "create": "Crear Red",
      "create_net": "Creando networks",
      "edit": "Editar",
      "net": "Red",
      "subdomain": "Subdominio"
    },
    "statics": {
      "activities": "Actividades",
      "events": "Eventos",
      "exam": "Examenes",
      "exam_delivery": "Entrega de examenes",
      "hmwrks": "Tareas",
      "hmwrks_delivery": "Entrega de tareas",
      "statics1": "Estadísticas del sistema"
    },
    "users": {
      "activities": "Manejador de actividades",
      "discuss": "Discusiones",
      "edit1": "Editar usuario",
      "exam": "Examenes",
      "find_usr": "Buscar Usuario",
      "hmwrks": "Tareas",
      "response": "Respuestas de tareas",
      "response2": "Respuestas de examen",
      "show1": "Mostrar actividades",
      "statics": "Estadísticas",
      "usr": "Manejador de datos de usuario"
    }
  },
  "support": {
    "array": {
      "last_word_connector": " y ",
      "two_words_connector": " y ",
      "words_connector": ", "
    }
  },
  "surveys": {
    "ajax": {
      "surveys_paginate_ajax": {
        "no_more_quest": "No se encontraron más cuestionarios pasados."
      }
    },
    "answer_fields": {
      "correct": "Correcta",
      "delete": "Eliminar",
      "response": "Ingresar respuesta"
    },
    "correct_create": "Cuestionario creado correctamente.",
    "correct_edit": "Cuestionario editado correctamente.",
    "form": {
      "add_quest": "Agregar Pregunta",
      "attempts": "Intentos",
      "cancel": "Cancelar",
      "courses": "Centros Emprendedores",
      "create": "Crear Cuestionario",
      "dates": "Fechas",
      "deliver_date": "Fecha de entrega",
      "example": "Ejemplo",
      "non_mins": "Sin límite de tiempo",
      "publish_date": "Día de pubicación",
      "quest": "Preguntas",
      "save": "Guardar Cuestionario",
      "support": "Material de soporte",
      "text1": "Números primos",
      "timer": "Tiempo para resolución del cuesitonario",
      "title": "Titulo del cuestionario"
    },
    "index": {
      "more_days": "Cuestionarios para responder en 3 días o más",
      "no_quest": "No tienes cuestionarios pendientes por contestar.",
      "section": "sección de cuestionarios Pasados",
      "see": "Puedes ver antiguos cuestionarios en la",
      "today": "Cuestionarios para responder Hoy",
      "tomorrow": "Cuestionarios para responder Mañana"
    },
    "lapsed": {
      "no_quest": "No se encontraron más cuestionarios pasados."
    },
    "my_surveys": {
      "no_quest": "No tienes cuestionarios por contestar."
    },
    "question_fields": {
      "add_answer": "Agregar Respuesta",
      "quest1": "Ingresar pregunta"
    },
    "select_course": "Selecciona un Centro Emprendedor para publicar tu cuestionario.",
    "shared": {
      "survey_card": {
        "edit": "Editar Cuestionario",
        "no_limit_time": "Sin límite de tiempo",
        "notice_helper": "Este cuestionario te dará",
        "notice_helper2": "minutos para responderlo",
        "quest": "Ver Cuestionario",
        "solve_time": "Minutos"
      },
      "survey_modal": {
        "calif": "Calificación Obtenida",
        "fail_attemps": "No tienes más intentos",
        "feedback": "Retroalimentación",
        "quest": "Cuestionario en el Centros Emprendedor",
        "response": "Responder antes del"
      },
      "survey_questions_modal": {
        "quest": "Enviar cuestionario"
      },
      "surveys_course_header": {
        "past": "Pasados",
        "quest": "Cuestionarios",
        "response": "Responder"
      },
      "surveys_courses_filter": {
        "filter": "Filtrar",
        "select": "Selecciona un Centros Emprendedor"
      },
      "surveys_header": {
        "past": "Pasados",
        "quest": "Cuestionarios",
        "response": "Responder"
      },
      "surveys_paginate_button": {
        "load": "Cargar más..."
      }
    },
    "survey_response_tpl": {
      "answer": "Contestar",
      "cancel": "Cancelar"
    },
    "surveys_course": {
      "more_days": "Cuestionarios para responder en 3 días o más",
      "no_quest": "No tienes cuestionarios pendientes por contestar en este Centros Emprendedor.",
      "past": "sección de cuestionarios Pasados",
      "see": "Puedes ver antiguos cuestionarios en la",
      "to_day": "Cuestionarios para responder Hoy",
      "tomorrow": "Cuestionarios para responder Mañana"
    },
    "surveys_course_lapsed": {
      "quest": "No se encontraron más cuestionarios pasados."
    }
  },
  "surveys_controller": {
    "no_accept": "Estas tratando de ver Cuestionarios de un Centros Emprendedor donde no has sido aceptado.",
    "no_exist": "El cuestionario que intentas ver no existe o ha sido borrado.",
    "no_quest_accept": "Estas tratando de ver Cuestionarios de un Centros Emprendedor donde no has sido aceptado.",
    "no_quest_register": "Estas tratando de ver Cuestionarios de un Centros Emprendedor donde no estas inscrito.",
    "no_register": "Estas tratando de ver Cuestionarios de un Centros Emprendedor donde no estas inscrito."
  },
  "time": {
    "am": "am",
    "formats": {
      "default": "%a, %d de %b de %Y a las %H:%M:%S %Z",
      "long": "%A, %d de %B de %Y a las %I:%M %p",
      "short": "%d de %b a las %H:%M hrs"
    },
    "pm": "pm"
  },
  "users": {
    "califications": {
      "deliveries_table": {
        "avg": "Calificación promedio en tareas",
        "hmwrk": "Tareas",
        "hmwrks": "Tarea",
        "no_deliver": "No entregada",
        "no_hmwrks": "Aún no hay tareas en este Centros Emprendedor.",
        "no_score": "No calificada",
        "percent": "Porcentaje: %{number}%",
        "score": "Calificación"
      },
      "discussions_table": {
        "avg_score": "Calificación promedio en discusiones",
        "discuss": "Discusiones",
        "discuss2": "Discusión",
        "no_discuss": "Aún no hay discusiones evaluables en este Centros Emprendedor.",
        "no_part": "Sin participación",
        "no_score": "No calificada",
        "percent": "Porcentaje: %{number}%",
        "score": "Calificación"
      },
      "enroll": "Necesitas estar inscrito en al menos un Centros Emprendedor para tener calificaciones.",
      "no_score": "Aún no tienes calificaciones.",
      "ratings": "Calificaciones",
      "surveys_table": {
        "avg": "Porcentaje: %{number}%",
        "exam": "Examen",
        "no_answered": "No resuelto",
        "quest": "Cuestionarios",
        "quest2": "Calificación promedio en cuestionarios",
        "quest3": "Aún no hay cuestionarios en este Centros Emprendedor.",
        "score": "Calificación"
      }
    },
    "courses": {
      "courses2": "Centros Emprendedores",
      "find": "Busca Centros Emprendedores en la sección de",
      "no_members": "Este usuario no esta inscrito en ningún Centros Emprendedor.",
      "no_registered": "Aún no estas inscrito en ningún Centros Emprendedor."
    },
    "dashboard": {
      "goto": "Ir al super MEEMS",
      "log_out": "Salir de mi sesión",
      "select": "Seleccionador de redes",
      "text1": "Cuando usted seleccione la network debera iniciar sesión en la red a la que se le dirija ya que es una celula independiente del sistema"
    },
    "evaluation": {
      "no_members": "Este Centros Emprendedor no tiene miembros",
      "score": "Calificacion"
    },
    "form_course": {
      "cancel": "Cancel",
      "create": "Crear nuevo",
      "create2": "Crear",
      "descrip": "Descripción",
      "init_date": "Fecha inicio",
      "load": "Cargando ...",
      "name": "Nombre",
      "private": "Privado",
      "public": "Público"
    },
    "friends": {
      "comunity": "Red de Emprendedores",
      "find": "Busca a tus amigos en la sección de",
      "friends_subtitle": {
        "all_friends": "Todos mis amigos",
        "friends1": "Amigos",
        "request": "Solicitudes pendientes"
      },
      "no_friends": "Aún no tienes amigos.",
      "no_friends2": "Este usuario no tiene amigos aún."
    },
    "friends_first_user": {
      "friend_req": "Solicitud de amistad",
      "friends": "Amigos",
      "pendent": "Solicitudes pendientes",
      "send": "Solicitud de amistad enviada"
    },
    "index": {
      "all": "Todos los usuarios"
    },
    "info": {
      "bio": "Biografia",
      "email": "Correo Electronico",
      "info2": "Información",
      "no_bio": "Este usuario no cuenta con biografia."
    },
    "menu_member": {
      "enroll": "inscribirse a una red",
      "friends": "mis amigos",
      "net": "mis redes"
    },
    "pendding_friends": {
      "no_request": "No hay solicitudes de amistad pendientes."
    },
    "set_password_form": {
      "pwd": "Ingresa una contraseña.",
      "save": "Guardar contraseña",
      "set_pwd": "Establece tu contraseña",
      "welcome": "Bienvenido a Cúrsame, es necesario que establezcas una contraseña para terminar con el proceso de registro."
    },
    "shared": {
      "user_card": {
        "add_friends": "Agregar a mis amigos",
        "admin": "MEEMS",
        "cancel": "Cancelar solicitud de amistad",
        "confirm": "Confirmar solicitud de amistad",
        "delete": "Eliminar de mis amigos",
        "delete2": "Eliminar solicitud de amistad",
        "friends": "Amigos",
        "respond": "Responder solicitud de amistad",
        "send_request": "Solicitud enviada",
        "student": "Emprendedor",
        "teacher": "Líder multiplicador"
      },
      "user_profile_header": {
        "accept": "Aceptar solicitud de amistad",
        "add_friends": "Añadir a mis amigos",
        "cancel": "Cancelar solictud de amistad",
        "courses": "Centros Emprendedores",
        "edit": "Editar Perfil",
        "friends": "Amigos",
        "ignore": "Ignorar",
        "info": "Información",
        "publications": "Publicaciones",
        "send": "Solicitud enviada",
        "update": "Actualizar portada",
        "update_photo": "Actualizar foto"
      }
    },
    "show": {
      "add": "Agrégalo para poder postear en su muro.",
      "no_friend": "No eres amigo del usuario"
    },
    "sufriend": {
      "accept": "Aceptar como amigo",
      "name": "Nombre"
    },
    "waiting_friends": {
      "friends": "Amigos en espera",
      "request": "Este usuario te ha solicitado amistad",
      "waiting_friends": "Esperando aceptación de"
    }
  },
  "users_controller": {
    "canot_delete": "No puedes borrar este usuario.",
    "correct_delete": "Usuario fue borrado correctamente",
    "deleted_usr": "El Usuario ya fue borrado",
    "no_exist": "El usuario que intentas ver no existe o ha sido borrado.",
    "no_register": "no estas inscrito en ninguna red",
    "save_pwd": "Se ha guardado tu contraseña correctamente."
  },
  "users_mailer": {
    "notice_to_user": {
      "activity": "tiene 5 nuevas actividades en la plataforma.",
      "activitys": "Tiene 5 nuevas actividades en la plataforma.",
      "goto": "Ir a actividades",
      "hello": "Hola",
      "notif": "Tiene 5 notificaciones activas",
      "welcome": "Bienvenido"
    },
    "teachers_day": {
      "click": "haz click aquí.",
      "happy": "¡Feliz día del Líder multiplicador!",
      "hello": "Hola",
      "mail": "Si no puedes ver este mail",
      "teacher": "Líder multiplicador(a)",
      "text1": "En Cúrsame estamos muy orgullosos de tí y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text2": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text3": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Líder multiplicador ¡Te lo mereces!"
    }
  },
  "usessions": {
    "new": {
      "confirm": "Esperando confirmación",
      "email": "Correo electrónico",
      "init_session": "Iniciar sesión",
      "pwd": "Contraseña",
      "remember": "Recordarme",
      "send": "Se ha enviado un correo a"
    }
  },
  "usessions_controller": {
    "hello": "Hola ",
    "invalid": "No se ha creado correctamente la sesión ya que la contraseña o el email son inválidos.",
    "welcome": " bienvenido de nuevo."
  },
  "views": {
    "pagination": {
      "first": "Inicio",
      "last": "Último",
      "next": "Siguiente",
      "previous": "Anterior",
      "truncate": "..."
    }
  },
  "will_paginate": {
    "next_label": "Siguiente &#8594;",
    "page_gap": "&hellip;",
    "previous_label": "&#8592; Anterior"
  }
};
I18n.translations["devise"] = {
  "active_admin": {
    "any": "Cualquiera",
    "batch_actions": {
      "action_label": "%{title} seleccionado",
      "button_label": "Acciones en masa",
      "delete_confirmation": "Eliminar %{plural_model}: ¿Está seguro? No podrá deshacer esta acción.",
      "labels": {
        "destroy": "Borrar"
      },
      "link": "Añadir",
      "selection_toggle_explanation": "(Cambiar selección)",
      "succesfully_destroyed": {
        "one": "Se ha destruido 1 %{model} con éxito",
        "other": "Se han destruido %{count} %{plural_model} con éxito"
      }
    },
    "blank_slate": {
      "content": "No hay %{resource_name} aún.",
      "entry": {
        "one": "registro",
        "other": "registros"
      },
      "link": "Añadir"
    },
    "cancel": "Cancelar",
    "comments": {
      "add": "Comentar",
      "author": "Autor",
      "body": "Cuerpo",
      "errors": {
        "empty_text": "El comentario no fue guardado, el texto estaba vacío."
      },
      "no_comments_yet": "Aún sin comentarios.",
      "resource": "Recurso",
      "title": "Comentario",
      "title_content": "Comentarios (%{count})"
    },
    "create_model": "Añadir %{model}",
    "dashboard": "Inicio",
    "dashboard_welcome": {
      "call_to_action": "Para agregar secciones edite 'app/admin/dashboard.rb'",
      "welcome": "Bienvenido a Active Admin. Esta es la página de inicio predeterminada."
    },
    "delete": "Eliminar",
    "delete_confirmation": "¿Está seguro de que quiere eliminar esto?",
    "delete_model": "Eliminar %{model}",
    "details": "Detalles de %{model}",
    "devise": {
      "change_password": {
        "submit": "Cambiar mi contraseña",
        "title": "Cambie su contraseña"
      },
      "links": {
        "forgot_your_password": "¿Olvidó su contraseña?",
        "sign_in": "registrarse",
        "sign_in_with_omniauth_provider": "Conéctate con %{provider}"
      },
      "login": {
        "remember_me": "Recordarme",
        "submit": "iniciar sesión",
        "title": "iniciar sesión"
      },
      "reset_password": {
        "submit": "Restablecer mi contraseña",
        "title": "¿Olvidó su contraseña?"
      }
    },
    "download": "Descargar:",
    "edit": "Editar",
    "edit_model": "Editar %{model}",
    "empty": "Vacío",
    "filters": {
      "buttons": {
        "clear": "Quitar Filtros",
        "filter": "Filtrar"
      },
      "predicates": {
        "contains": "Contiene",
        "ends_with": "Termina con",
        "equals": "Igual a",
        "greater_than": "Mayor que",
        "less_than": "Menor que",
        "starts_with": "Empieza con"
      }
    },
    "has_many_delete": "Eliminar",
    "has_many_new": "Agregar Añadir %{model}",
    "has_many_remove": "Quitar",
    "logout": "Salir",
    "main_content": "Por favor implemente %{model}#main_content para mostrar contenido.",
    "new_model": "Añadir %{model}",
    "next": "Siguiente",
    "pagination": {
      "empty": "No se han encontrado %{model}",
      "multiple": "Mostrando %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b> de un total de <b>%{total}</b>",
      "multiple_without_total": "Mostrando %{model} <b>%{from}&nbsp;-&nbsp;%{to}</b>",
      "one": "Mostrando <b>1</b> %{model}",
      "one_page": "Mostrando <b>un total de %{n}</b> %{model}"
    },
    "powered_by": "Powered by %{active_admin} %{version}",
    "previous": "Anterior",
    "sidebars": {
      "filters": "Filtros"
    },
    "update_model": "Editar %{model}",
    "view": "Ver"
  },
  "activemodel": {
    "errors": {
      "format": "%{attribute} %{message}",
      "messages": {
        "accepted": "debe ser aceptado",
        "blank": "no puede estar en blanco",
        "confirmation": "no coincide con la confirmación",
        "empty": "no puede estar vacío",
        "equal_to": "debe ser igual a %{count}",
        "even": "debe ser un número par",
        "exclusion": "está reservado",
        "extension_white_list_error": "No puedes subir este tipo de archivo",
        "greater_than": "debe ser mayor que %{count}",
        "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
        "inclusion": "no está incluído en la lista",
        "invalid": "es inválido",
        "less_than": "debe ser menor que %{count}",
        "less_than_or_equal_to": "debe ser menor o igual que %{count}",
        "not_a_number": "no es un número",
        "not_an_integer": "debe ser un entero",
        "not_found": " no encontrado.",
        "odd": "debe ser un número non",
        "record_invalid": "La validación falló: %{errors}",
        "taken": "ya ha sido tomado",
        "too_long": {
          "one": "es demasiado largo (máximo 1 caracter)",
          "other": "es demasiado largo (máximo %{count} caracteres)"
        },
        "too_short": {
          "one": "es demasiado corto (mínimo 1 caracter)",
          "other": "es demasiado corto (mínimo %{count} caracteres)"
        },
        "wrong_length": {
          "one": "longitud errónea (debe ser de 1 caracter)",
          "other": "longitud errónea (debe ser de %{count} caracteres)"
        }
      },
      "template": {
        "body": "Revise que los siguientes campos sean válidos:",
        "header": {
          "one": "%{model} no pudo guardarse debido a 1 error",
          "other": "%{model} no pudo guardarse debido a %{count} errores"
        }
      }
    }
  },
  "activerecord": {
    "errors": {
      "format": "%{attribute} %{message}",
      "messages": {
        "accepted": "debe ser aceptado",
        "blank": "no puede estar en blanco",
        "confirmation": "no coincide con la confirmación",
        "empty": "no puede estar vacío",
        "equal_to": "debe ser igual a %{count}",
        "even": "debe ser un número par",
        "exclusion": "está reservado",
        "extension_white_list_error": "No puedes subir este tipo de archivo",
        "greater_than": "debe ser mayor que %{count}",
        "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
        "inclusion": "no está incluído en la lista",
        "invalid": "es inválido",
        "less_than": "debe ser menor que %{count}",
        "less_than_or_equal_to": "debe ser menor o igual que %{count}",
        "not_a_number": "no es un número",
        "not_an_integer": "debe ser un entero",
        "not_found": " no encontrado.",
        "odd": "debe ser un número non",
        "record_invalid": "La validación falló: %{errors}",
        "taken": "ya ha sido tomado",
        "too_long": {
          "one": "es demasiado largo (máximo 1 caracter)",
          "other": "es demasiado largo (máximo %{count} caracteres)"
        },
        "too_short": {
          "one": "es demasiado corto (mínimo 1 caracter)",
          "other": "es demasiado corto (mínimo %{count} caracteres)"
        },
        "wrong_length": {
          "one": "longitud errónea (debe ser de 1 caracter)",
          "other": "longitud errónea (debe ser de %{count} caracteres)"
        }
      },
      "template": {
        "body": "Revise que los siguientes campos sean válidos:",
        "header": {
          "one": "%{model} no pudo guardarse debido a 1 error",
          "other": "%{model} no pudo guardarse debido a %{count} errores"
        }
      }
    }
  },
  "activities": {
    "show": {
      "avg": "Promedio:",
      "deliveries": "Entregas",
      "geo_c": "geocode:",
      "lat": "Latitud:",
      "long": "Longitud:",
      "net": "Red:",
      "os": "Sistema operativo:",
      "place": "Lugar:",
      "title": "Título:",
      "title_act": "Tipo de Actividad:",
      "ver": "Versión:",
      "without_act": "sin actividades"
    }
  },
  "admin": {
    "form_for_import_users_to_network": {
      "import": "Importar archivo de usuarios"
    },
    "masive_mailer": {
      "forward": "Reenviar el mensaje a la siguiente cantidad de usuarios con la clave de mensaje",
      "mail": "Se activará el formulario de reenvio cuando la cuenta de mailers masivos se mayor a 0",
      "massive_email": "Enviar mensajes masivos a los siguientes usuarios",
      "send_msg": "Enviar mensajes",
      "text1": "title",
      "text2": "titulo",
      "text3": "message",
      "text4": "number of users when yo want send",
      "text5": "number",
      "text6": "Esta es la clave asignada al mensaje"
    },
    "users": {
      "change_password": {
        "new_pwd": "Nueva contraseña:"
      }
    }
  },
  "ajax_controller": {
    "error1": "Ocurrió un error, porfavor inténtalo de nuevo."
  },
  "assets": {
    "asset_file": {
      "delete": "Borrar"
    },
    "messages": {
      "delete": {
        "error": "Ha ocurrido un error al eliminar el archivo.",
        "non_existent": "El archivo que intentas borrar no existe.",
        "not_an_owner": "No tienes permisos para eliminar este archivo.",
        "success": "Se ha eliminado el archivo."
      }
    },
    "upload_asset_button": {
      "file": "Archivo"
    }
  },
  "assignments": {
    "correct": "Se ha calificado correctamente la tarea.",
    "error": "Ha ocurrido un error al calificar la tarea.",
    "form_for_delivery": {
      "cancel": "Cancelar",
      "descrip": "Descripción:",
      "dlvry": "Entregar Tarea",
      "file_dlvry": "Archivos de entrega:",
      "save_dlvry": "Guardar nueva entrega",
      "title": "Título:"
    },
    "messages": {
      "create": {
        "error": "Ha ocurrido un error al entregar tu tarea",
        "success": "Se ha entregado tu tarea"
      },
      "update": {
        "error": "Ha ocurrido un error al actualizar tu tarea",
        "success": "Se ha actualizado tu tarea",
        "sucess": "Se ha actualizado tu tarea"
      }
    },
    "responce_of_evaluation": {
      "comments": "Comentarios",
      "entry": "Rubro"
    }
  },
  "attributes": {
    "bios": "Biografía",
    "confirmation_token": "El correo electrónico de confirmación",
    "current_password": "Contraseña actual",
    "email": "Correo electrónico",
    "first_name": "Nombre",
    "last_name": "Apellido",
    "personal_url": "Dirección de usuario personalizada"
  },
  "calendar": {
    "index": {
      "back_month": "← Mes anterior",
      "day1": "D",
      "day2": "L",
      "day3": "M",
      "day4": "M",
      "day5": "J",
      "day6": "V",
      "day7": "S",
      "friday": "Viernes",
      "monday": "Lunes",
      "next_month": "Mes siguiente →",
      "saturday": "Sabado",
      "sunday": "Domingo",
      "thursday": "Jueves",
      "tuesday": "Martes",
      "wednesday": "Miercoles"
    }
  },
  "califications": {
    "course": {
      "active_courses": "Cursos activos",
      "calification": "Calificación:",
      "criterion": "Criterio",
      "final_score": "Calificación final",
      "no_members": "Este curso no tiene miembros",
      "no_printable_score": "Tu profesor todavia no te ha dado calificación final.",
      "no_score": "Aún no tienes calificación final.",
      "percent": "Porcentaje:",
      "score": "Calificación Obtenida"
    },
    "member": {
      "final_score": "Calificación final:",
      "members": "Miembros",
      "no_score": " Sin Calificar",
      "score": "Calificación Cúrsame:"
    },
    "shared": {
      "califications_course_header": {
        "califications": "Calificaciones"
      },
      "califications_courses_list": {
        "member": "Miembro",
        "members": "Miembros",
        "no_courses": "No hay cursos para ver calificaciones.",
        "select_course": "Selecciona un curso"
      },
      "califications_header": {
        "active_courses": "Cursos activos",
        "califications": "Calificaciones",
        "closed_courses": "Cursos finalizados",
        "grades": "Calificaciones"
      }
    }
  },
  "comments": {
    "no_exist": "El comentario que intentas ver no existe o ha sido borrado.",
    "shared": {
      "comment_admin_actions": {
        "confirm": "¿Estas seguro de borrar este comentario?",
        "delete": "Borrar"
      },
      "comment_card": {
        "edit_comment": "Editar Comentario"
      },
      "comment_user_actions": {
        "denounce_comment": "Denunciar comentario"
      }
    }
  },
  "community": {
    "all": {
      "no_records": "No hay más usuarios por mostrar...",
      "no_usr": "No se encontraron usarios en tu red."
    },
    "search": {
      "no_usr": "No se encontraron usarios en tu red.",
      "search": "Búsqueda:"
    },
    "shared": {
      "community_header": {
        "all": "Todos",
        "community": "Comunidad",
        "students": "Estudiantes",
        "teacher": "Profesores"
      },
      "community_paginate_button": {
        "load_more": "Cargar más..."
      },
      "users_search": {
        "find": "Buscar",
        "search_users": "Buscar usuarios..."
      }
    },
    "students": {
      "no_more_usr": "No hay más usuarios por mostrar...",
      "no_students": "Aún no hay estudiantes en tu red."
    },
    "teachers": {
      "no_more_usr": "No hay más usuarios por mostrar...",
      "no_students": "Aún no hay profesores en tu red."
    }
  },
  "content": {
    "assignments": {
      "adding": {
        "confirm": "¿Eliminar archivo?",
        "confirm1": "¿Eliminar contenido?",
        "delete": "Borrar"
      }
    }
  },
  "course_files": {
    "library_item": {
      "confirm": "¿Estas seguro de querer eliminar este archivo?",
      "delete": "Borrar"
    }
  },
  "courses": {
    "about": {
      "admins": "Administradores del curso",
      "course_info": "Información del Curso",
      "info": "Información.",
      "init_date": "Fecha de incio"
    },
    "activities_depot": {
      "act": "Actividades",
      "back_to": "Regresar al curso",
      "more_act": "Cargar más actividades",
      "select_act": "Selecciona una actividad."
    },
    "all_courses": {
      "no_records": "No hay más cursos para mostrar."
    },
    "clone_course_view": {
      "clone": "Clonar curso",
      "clone2": "(clonado)",
      "clone_hmwrks": "Selecciona las tareas que quieres clonar para el nuevo curso.",
      "data_course": "Datos del curso",
      "dates": "Fechas",
      "delivery_date": "Fecha Entrega",
      "descrip": "Descripción",
      "example": "Ejemplo: Matemáticas I",
      "hmwrks": "Tareas",
      "info_new_course": "Cambia la información para el nuevo curso.",
      "init_date": "Fecha de inicio",
      "name": "Nombre del",
      "privacy": "Privacidad",
      "private": "Privado",
      "public": "Público",
      "publish_date": "Fecha de publicación"
    },
    "closure": {
      "closure_members": {
        "final_scores": "Calificaciones finales",
        "invite": "Invita a tus alumnos que se unan a tu curso.",
        "members": "Miembros",
        "no_members": "No hay miembros en el curso.",
        "no_score": "Sin calificar",
        "score": "Calificación:",
        "send_scores": "Envia la calificación final a los estudiantes del grupo."
      },
      "user_closure_overview": {
        "calif": "Calificación:",
        "criterium": "Criterio",
        "discuss": "Discusiones",
        "example8": "Ejemplo: 8",
        "final_score": "Calificación Final",
        "hmwrk": "Tareas",
        "members": "Miembros",
        "no_rate": "Sin calificar",
        "of": "de",
        "participate": "Participo en",
        "percent": "Porcentaje:",
        "quest": "Cuestionarios",
        "rate_student": "Calificar alumno",
        "respond": "Contesto",
        "score": "Calificación Obtenida",
        "send": "Entrego"
      }
    },
    "courses_search": {
      "courses_search": "Buscar curso...",
      "search": "Buscar"
    },
    "dashboard_deliver": {
      "access": "Acceso rápido de administración de cursos",
      "activate": "activar curso",
      "calif": "Calificaciones",
      "count_test": "Contador de examenes respondidos",
      "desactivate": "Desactivar",
      "hmwrks_course": "Tareas en el curso",
      "inactive": "Inactivo",
      "monitor": "Monitor de actividades"
    },
    "edit": {
      "edit": "Editar curso"
    },
    "edit_delivery_access": {
      "courses": "Cursos",
      "delivery_day": "Ultimo día de entrega",
      "descrip": "Descripción",
      "hmwrk_title": "Titulo de la tarea",
      "publish": "Publicar",
      "publish_date": "Día de pubicación"
    },
    "evaluation": {
      "calif": "Calificación",
      "course_score": "Calificación del curso",
      "deliver": "Entrega",
      "eval": "% de la Evaluación",
      "exam": "Examen",
      "final": "% Final",
      "hmwrk": "Tarea",
      "items": "Rubros",
      "no_deliver": "Sin entregar",
      "no_group": "No eres parte del grupo!",
      "no_member": "No has sido aceptado en el grupo!",
      "obtained": "Obtenido",
      "pdf": "Descargar (PDF)",
      "percent_obtain": "% obtenido",
      "percent_obtain1": "% Obtenido",
      "score": "Calificacion",
      "student": "Alumno:",
      "total_score": "Calificación Total",
      "unresolved": "Sin resolver"
    },
    "evaluation_download": {
      "calif": "Calificación",
      "deliver": "Entrega",
      "eval": "de la Evaluación",
      "eval_percent": "de la Evaluación",
      "exam": "Examen",
      "final": "Final",
      "hmwrk": "Tarea",
      "no_accept": "No has sido aceptado en el grupo!",
      "no_part": "No eres parte del grupo!",
      "not_resolved": "Sin resolver",
      "obtain_percent": "Obtenido",
      "obtain_percent2": "obtenido",
      "ruber": "Rubros",
      "student": "Alumno",
      "total_score": "Calificación Total",
      "undelivered": "Sin entregar"
    },
    "evaluation_schema": {
      "add_criterium": "Agregar criterio de evaluación",
      "cancel": "Cancelar",
      "criterium": "Criterio",
      "percent": "Porcentaje",
      "save": "Guardar",
      "text1": "Especifica como quieres evaluar este curso, puedes agregar nuevos criterios de evaluación o solo dejar los criterios de Cúrsame."
    },
    "form": {
      "add_students": "Inscribe estudiantes a tu curso.",
      "confirm": "¿Esta seguro que desea eliminar este curso?",
      "create": "Crear",
      "delete": "Eliminar curso permanente.",
      "descrip": "Descripción del",
      "descrip2": "Descripción",
      "example": "Ejemplo: Matemáticas I",
      "find_students": "Busca estudiantes para unirlos automaticamente al curso.",
      "first_name": "Escribe un nombre o apellido.",
      "init_date": "Fecha de inicio",
      "name": "Nombre del",
      "privacy": "Privacidad",
      "private": "Privado",
      "public": "Público",
      "save": "Guardar cambios",
      "students": "Estudiantes",
      "teachers": "Profesor"
    },
    "form_course": {
      "descrip": "Descripción",
      "init_date": "Fecha inicio",
      "name": "Nombre del",
      "privacy": "Privacidad",
      "private": "Privado",
      "public": "Público",
      "return": "Regresar al",
      "update": "Actualizar"
    },
    "index": {
      "student_courses_index": {
        "no_courses": "No hay cursos.",
        "no_show": "No hay más cursos para mostrar."
      },
      "student_header": {
        "course": "Cursando",
        "courses": "Cursos",
        "regist": "Inscríbete",
        "request": "Solicitudes"
      },
      "teacher_courses_index": {
        "no_courses": "No hay cursos.",
        "no_show": "No hay más cursos para mostrar."
      },
      "teacher_header": {
        "active": "Activos",
        "courses": "Cursos",
        "create_course": "Crear curso nuevo",
        "finalize": "Finalizados",
        "new": "Nuevo"
      }
    },
    "library": {
      "biblio": "Biblioteca",
      "file": "Archivo",
      "files": "Archivos",
      "load": "Cargar más archivos",
      "no_files": "Este curso no tiene archivos en su librería.",
      "text2": "Cúrsame no se hace responsable del contenido subido por los usuarios, ni de cualquier infracción a derechos de autor o de marca por los mismos.  El usuario que ha subido contenido es 100% responsable de él. Cualquier problema de este tipo favor de reportarlo",
      "upload": "Subir archivo"
    },
    "light_box_dashboard_delivery": {
      "criterium": "Criterios de calificación",
      "descrip": "Descripción de entrega",
      "eval": "Seleccione un porcentaje de 1 a 100 para calificar esta tarea",
      "eval_hmwrk": "Calificar tarea",
      "files": "Archivos de la entrega",
      "hmwrk_score": "Calificación de la tarea",
      "percent": "Por favor selecciona un porcentaje de 1 a 100 para calificar esta tarea",
      "score": "Calificación",
      "student": "Alumno",
      "title": "Titulo de entrega"
    },
    "members": {
      "mem": "Miembros",
      "no_members": "Curso sin miembros.",
      "no_records": "Este curso todavia no tiene miembros en el."
    },
    "members_in_courses": {
      "course_view_call": {
        "no_courses": "No hay cursos."
      },
      "owner_partial_for_member": {
        "admin": "Administrador",
        "student": "Estudiante",
        "teacher": "Profesor"
      },
      "permissionings_edit": {
        "confirm": "¿Estás seguro de querer eliminar este usuario del curso?",
        "delete": "Eliminar",
        "delete_group": "Eliminar del grupo",
        "usr_accept": "Aceptar Usuario"
      }
    },
    "new": {
      "new_course": "Curso nuevo"
    },
    "old_course": {
      "activate": "activar curso",
      "antique": "Cursos antiguos",
      "deactivate": "desactivar curso"
    },
    "pending": {
      "pending": {
        "no_request": "No hay más solicitudes pendientes."
      }
    },
    "search": {
      "courses_search_results": {
        "no_records": "No se encontraron cursos con el criterio de busqueda.",
        "search": "Busqueda:"
      }
    },
    "shared": {
      "course_card": {
        "member": "Miembro",
        "members": "Miembros"
      },
      "course_card_actions": {
        "active": "Activar",
        "activities_score": "Calificar actividades",
        "clone": "Clonar",
        "confirm": "¿Esta seguro de querer abandonar este curso?",
        "edit": "Editar",
        "enroll": "Estás inscrito",
        "eval_form": "Forma de evaluación",
        "final_score": "Calificaciones finales",
        "finalize": "Finalizar",
        "leave": "Abandonar curso",
        "request_send": "Solicitud enviada",
        "send_request": "Enviar solicitud"
      },
      "course_card_post": {
        "new_course": "Nuevo curso público"
      },
      "course_evaluation_schema_fields": {
        "criterium": "¿Que criterio se evaluará?",
        "discuss": "Discusiones",
        "hmwrks": "Tareas",
        "percent": "Porcentaje asignado",
        "quest": "Cuestionarios"
      },
      "course_header": {
        "active": "Activar",
        "activities_score": "Calificar actividades",
        "clone": "Clonar",
        "edit": "Editar",
        "eval_form": "Forma de evaluación",
        "final": "Finalizar",
        "final_score": "Calificaciones finales",
        "info": "Información",
        "library": "Biblioteca",
        "members": "Miembros",
        "publ": "Publicaciones",
        "update": "Actualizar portada",
        "update_photo": "Actualizar foto"
      },
      "courses_paginate_button": {
        "load_more": "Cargar más..."
      }
    },
    "show": {
      "course-header": {
        "active": "Activar",
        "activities_score": "Calificar actividades",
        "clone": "Clonar",
        "edit": "Editar",
        "eval_form": "Forma de evaluación",
        "final": "Finalizar",
        "final_score": "Calificaciones finales",
        "info": "Información",
        "library": "Biblioteca",
        "members": "Miembros",
        "publ": "Publicaciones",
        "update": "Actualizar portada",
        "update_photo": "Actualizar foto"
      }
    },
    "statics": {
      "active_hmwrk": "TAREAS ACTIVAS",
      "activity": "ACTIVIDADES",
      "discuss": "DISCUSIONES",
      "generate": "Se han generado",
      "in_course": "En el curso",
      "quest": "CUESTIONARIO",
      "total": "totales"
    },
    "survey_results": {
      "back": "Atras",
      "respose": "Respuesta",
      "result": "Resultado obtenido",
      "student": "Alumno"
    },
    "unpublished_courses": {
      "no_courses": "No hay más cursos para mostrar."
    }
  },
  "courses_controller": {
    "active": "se activo correctamente.",
    "clone_correct": "Curso clonado correctamente.",
    "contact": "ha finalizado, contacta al profesor para más información.",
    "create": "Se ha creado correctamente tu curso, edita tu forma de evaluación.",
    "delete": "Curso eliminado correctamente.",
    "ended": "se finalizo correctamente.",
    "has_ended": "ha finalizado, lo puedes activar en el menu de opciones del curso.",
    "no_accepted": "No has sido aceptado en este curso.",
    "no_access": "El curso al que intentas accesar, no existe o ha sido borrado.",
    "no_authorized": "Usted no está autorizado para editar este curso.",
    "no_exist": "El curso que intentas ver no existe o ha sido borrado",
    "save": "Se han guardado satisfactoriamente los cambios en el curso. ",
    "search": "Escribe algo en el campo de busqueda.",
    "success": "Se ha creado correctamente",
    "the_course": "El curso",
    "your_course": "Tu curso"
  },
  "date": {
    "abbr_day_names": [
      "dom",
      "lun",
      "mar",
      "mié",
      "jue",
      "vie",
      "sáb"
    ],
    "abbr_month_names": [
      null,
      "ene",
      "feb",
      "mar",
      "abr",
      "may",
      "jun",
      "jul",
      "ago",
      "sep",
      "oct",
      "nov",
      "dic"
    ],
    "day_names": [
      "domingo",
      "lunes",
      "martes",
      "miércoles",
      "jueves",
      "viernes",
      "sábado"
    ],
    "formats": {
      "default": "%d/%m/%Y",
      "long": "%A, %d de %B de %Y",
      "short": "%d de %b"
    },
    "month_names": [
      null,
      "enero",
      "febrero",
      "marzo",
      "abril",
      "mayo",
      "junio",
      "julio",
      "agosto",
      "septiembre",
      "octubre",
      "noviembre",
      "diciembre"
    ],
    "order": [
      "day",
      "month",
      "year"
    ]
  },
  "datetime": {
    "distance_in_words": {
      "about_x_hours": {
        "one": "cerca de 1 hora",
        "other": "cerca de %{count} horas"
      },
      "about_x_months": {
        "one": "cerca de 1 mes",
        "other": "cerca de %{count} meses"
      },
      "about_x_years": {
        "one": "cerca de 1 año",
        "other": "cerca de %{count} años"
      },
      "almost_x_years": {
        "one": "casi 1 año",
        "other": "casi %{count} años"
      },
      "half_a_minute": "medio minuto",
      "less_than_x_minutes": {
        "one": "menos de 1 minuto",
        "other": "menos de %{count} minutos"
      },
      "less_than_x_seconds": {
        "one": "menos de 1 segundo",
        "other": "menos de %{count} segundos"
      },
      "over_x_years": {
        "one": "más de 1 año",
        "other": "más de %{count} años"
      },
      "x_days": {
        "one": "1 día",
        "other": "%{count} días"
      },
      "x_minutes": {
        "one": "1 minuto",
        "other": "%{count} minutos"
      },
      "x_months": {
        "one": "1 mes",
        "other": "%{count} meses"
      },
      "x_seconds": {
        "one": "1 segundo",
        "other": "%{count} segundos"
      }
    },
    "prompts": {
      "day": "Día",
      "hour": "Hora",
      "minute": "Minuto",
      "month": "Mes",
      "second": "Segundos",
      "year": "Año"
    }
  },
  "deliveries": {
    "deliveries_course": {
      "hmwrks": "Tareas para entregar en 3 días o más",
      "hmwrks_last": "tareas pasadas en la sección Pasadas",
      "no_deliver": "Has entregado todas las tareas, puedes ver las",
      "no_hmwrks": "No tienes tareas pendientes por entregar en este curso.",
      "today_hmwrk": "Tareas para entregar Hoy",
      "tomorrow_hmwrks": "Tareas para entregar Mañana"
    },
    "deliveries_courses_lapsed": {
      "last_hmwrks": "No se encontraron más tareas pasadas."
    },
    "delivery_compart_form": {
      "add_criterium": "Agregar criterio",
      "cancel": "Cancelar",
      "courses": "Cursos",
      "criterium": "Criterios a evaluar",
      "dates": "Fechas",
      "deliver_date": "Fecha de entrega",
      "descrip": "Descripción",
      "example": "Ejemplo: Números primos",
      "hmwrk_theme": "Tema de la tarea",
      "integrity": "Por integridad de la actividad no se permiten modificar los archivos, contenidos y criterios después de ser creada le pedimos de la manera mas atenta si necesita agregar alguno de estos elimine la actividad y vuelva a cargarla.",
      "publish": "Publicar",
      "publish_date": "Día de publicación",
      "save": "Guardar Tarea",
      "support": "Material de soporte"
    },
    "index": {
      "deliver_hmwrks": "Tareas para entregar en 3 días o más",
      "hmwrks": "Tareas para entregar Hoy",
      "no_deliver": "Has entregado todas las tareas, puedes ver las",
      "no_hmwrks": "No tienes tarean pendientes por entregar.",
      "past_hmwrks": "tareas pasadas en la sección Pasadas",
      "tomorrow_hmwrks": "Tareas para entregar Mañana"
    },
    "lapsed": {
      "no_hmwrks": "No se encontraron más tareas pasadas."
    },
    "shared": {
      "deliveries_course_header": {
        "active": "Activas",
        "hmwrks": "Tareas",
        "last": "Pasadas"
      },
      "deliveries_filter_course": {
        "filter": "Filtrar: ",
        "select": "Selecciona un curso"
      },
      "deliveries_header": {
        "deliver": "Entregar",
        "hmwrks": "Tareas",
        "past": "Pasadas"
      },
      "deliveries_paginate_button": {
        "load": "Cargar más..."
      },
      "delivery_card": {
        "edit_hmwrk": "Editar Tarea",
        "hmwrk": "Ver Tarea"
      },
      "delivery_modal": {
        "deliver": "Entregar antes del",
        "deliver_hmwrk": "Entregar Tarea",
        "edit": "Editar Entrega",
        "final_score": "Calificación final obtenida",
        "hmwrk": "Tarea en el curso",
        "rubre": "Rubro sin comentarios"
      }
    }
  },
  "deliveries_controller": {
    "access_denied": "Estas tratando de ver Tareas de un curso donde no has sido aceptado.",
    "register": "Estas tratando de ver Tareas de un curso donde no estas inscrito."
  },
  "devise": {
    "confirmations": {
      "new": {
        "email": "Correo electrónico",
        "email_field": "Por favor, ingresa tu correo en el campo de abajo para dar seguimiento a tu solicitud",
        "forward": "Reenviar instrucciones",
        "no_confirmation": "No has recibido confirmación"
      }
    },
    "mailer": {
      "confirmation_instructions": {
        "push_here": "Si el boton superior no funciona, haz clic aquí",
        "usage": "Para poder utilizar tu cuenta necesitamos que confirmes tu correo electrónico, es muy sencillo: haz click en el siguiente botón y estarás listo para utilizar tu nueva plataforma de estudio.",
        "welcome": "¡Bienvenido a Cúrsame!"
      },
      "reset_password_instructions": {
        "button": "Si el boton superior no funciona, haz clic aquí",
        "pwd": "En caso que no hayas solicitado la restauración de tu contraseña por favor comunicalo a",
        "reset_password": "Nos has indicado que deseas restaurar tu contraseña, para hacerlo solo debes dar click en el botón inferior y seguir las instrucciones.",
        "reset_pwd": "Restaurar contraseña"
      },
      "unlock_instructions": {
        "button": "Si el boton superior no funciona, haz clic aquí",
        "hello": "¡Hola!"
      }
    },
    "passwords": {
      "edit": {
        "ch_pwd": "Cambiar contraseña",
        "change_pwd": "Cambia tu contraseña",
        "confirm_pwd": "Confirmar contraseña",
        "new_pwd": "Nueva contraseña"
      },
      "new": {
        "email": "Ingresa el correo electrónico con el cual te diste de alta y presiona el botón de \"reactivar contraseña\".",
        "email_field": "Correo electrónico",
        "recover_pwd": "Recupera tu contraseña",
        "res_pwd": "Recuperar contraseña"
      }
    },
    "registrations": {
      "edit": {
        "back": "Regresar",
        "cancel_acount": "Cancela tu cuenta",
        "down": "¿Quieres darte de baja?",
        "edit_usr": "Editar Usuario",
        "pwd": "Contraseña",
        "update": "Actualizar"
      },
      "new": {
        "accept": "Acepto los términos y condiciones",
        "access": "Lo sentimos pero la red a la que estas intentado accesar no existe",
        "confirm_pwd": "Confirmacion de contraseña",
        "email": "Correo electrónico",
        "last_name": "Apellidos",
        "name": "Nombre(s)",
        "no_blocked": "¿No recibiste las instrucciones de desbloqueo?",
        "no_confirmation": "¿No recibiste las instrucciones de confirmación?",
        "pwd": "Contraseña",
        "question": "pregunta a un encargado de tu escuela él sabrá ayudarte.",
        "registry": "Registrarme",
        "sign_in": "¿Ya eres usuario? Ingresa",
        "thnx": "¡Gracias!"
      }
    },
    "sessions": {
      "new": {
        "account_window": "te enviará a una pantalla que te pedirá tu email para que te volvamos a enviar los datos de confirmación.",
        "acount": "Confirma tu cuenta",
        "antique_usr": "Soy un usuario antiguo y tengo dudas",
        "change_pwd": "te pedirá que cambies tu contraseña.",
        "close": "Cerrar",
        "confirm": "Esperando confirmación",
        "confirm2": "No me ha llegado el mail de confirmación",
        "confirm3": "Confirmé mi email pero olvide cambiar mi contraseña",
        "email": "Correo electrónico",
        "forgot_pwd": "Olvidé mi contraseña",
        "init": "Ir al inicio",
        "key": "¿Mi clave sigue siendo la misma?",
        "last_user": "Si eras usuario en la plataforma anterior aún sigues siendo usuario en Cúrsame.",
        "link": "Da click en el link",
        "log_in": "Iniciar Sesión",
        "net": "La red a la que estas intentado accesar no existe",
        "net2": "pregunta a un encargado de tu escuela él sabrá ayudarte.",
        "new_pwd": "Se han generado nuevas contraseñas cuando confirmes tu correo electrónico con el mail que enviamos",
        "pwd": "Contraseña",
        "pwd_problem": "Cualquier problema con la contraseña puedes resolverlo dando click en",
        "remember": "Recordarme",
        "s_net": "Clases, Actividades, Red Social.",
        "s_net2": "Cúrsame conecta a directivos, profesores y alumnos",
        "s_net3": "permitiéndoles interactuar social y académicamente.",
        "s_netn": "Cúrsame conecta a directivos, profesores y alumnos permitiéndoles interactuar social y académicamente",
        "send": "Se ha enviado un correo a",
        "send_pwd": "donde se te enviará un mail para que puedas cambiar tu contraseña.",
        "session": "Inicia sesión",
        "sign_in": "¿Eres nuevo? Regístrate",
        "sorry": "Lo sentimos",
        "user": "¿Soy usuario?"
      }
    },
    "shared": {
      "footer-links": {
        "help": "Centro de ayuda",
        "privacy": "Aviso de privacidad",
        "terms": "Términos y Condiciones"
      },
      "links": {
        "blocked": "¿No recibiste las instrucciones de desbloqueo?",
        "confirm": "¿No recibiste las instrucciones de confirmación?",
        "log_in": "¿Ya eres usuario? Ingresa",
        "pwd": "¿Olvidaste tu contraseña?",
        "sign_in": "¿No estas registrado? Registrate"
      }
    },
    "unlocks": {
      "new": {
        "email": "Correo electrónico",
        "email_req": "Ingresa tu correo en el campo inferior para dar seguimiento a tu solicitud",
        "forward": "Reenviar instrucciones",
        "instruc": "No has recibido instrucciones de desbloqueo"
      }
    }
  },
  "discussions": {
    "correct_edit": "Discusión editada correctamente",
    "create_discuss": "Discusión creada correctamente",
    "discussions_course": {
      "no_discuss": "No se encontraron más discusiones."
    },
    "form_for_discussion": {
      "add_comment": "Agregar criterio",
      "calif": "Calificable",
      "cancel": "Cancelar",
      "create_discuss": "Crear Discusión",
      "criterium": "Criterios a evaluar",
      "dates": "Fechas",
      "deliver_date": "Fecha de entrega",
      "descrip": "Descripción",
      "discuss": "Tema de la discusión",
      "example": "Ejemplo: Números primos",
      "public": "Público",
      "publish_date": "Día de publicación",
      "save_discuss": "Guardar discusión",
      "support": "Material de soporte"
    },
    "index": {
      "no_discuss": "No se encontraron más discusiones."
    },
    "shared": {
      "discussion_card": {
        "edit_discuss": "Editar Discusión",
        "view_discuss": "Ver Discusión"
      },
      "discussion_modal": {
        "criterium": "Criterios a evaluar",
        "grade": "Calificación Obtenida",
        "in_course": "en el curso",
        "init_discuss": "ha inicidado una discusión"
      },
      "discussions_course_header": {
        "discuss": "Discusiones"
      },
      "discussions_filter_course": {
        "filter": "Filtrar:",
        "select": "Selecciona un curso"
      },
      "discussions_header": {
        "discuss": "Discusiones"
      },
      "discussions_paginate_button": {
        "load": "Cargar más..."
      }
    }
  },
  "discussions_controller": {
    "delete": "La discusión que intentas ver no existe o ah sido borrada.",
    "no_accepted": "Estas tratando de ver Discusiones de un curso donde no has sido aceptado.",
    "no_discussion": "No se pudo crear la discusión.",
    "no_register": "Estas tratando de ver Discusiones de un curso donde no estas inscrito."
  },
  "errors": {
    "format": "%{attribute} %{message}",
    "messages": {
      "accepted": "debe ser aceptado",
      "blank": "no puede estar en blanco",
      "confirmation": "no coincide con la confirmación",
      "empty": "no puede estar vacío",
      "equal_to": "debe ser igual a %{count}",
      "even": "debe ser un número par",
      "exclusion": "está reservado",
      "extension_white_list_error": "No puedes subir este tipo de archivo",
      "greater_than": "debe ser mayor que %{count}",
      "greater_than_or_equal_to": "debe ser mayor o igual que %{count}",
      "inclusion": "no está incluído en la lista",
      "invalid": "es inválido",
      "less_than": "debe ser menor que %{count}",
      "less_than_or_equal_to": "debe ser menor o igual que %{count}",
      "not_a_number": "no es un número",
      "not_an_integer": "debe ser un entero",
      "not_found": " no encontrado.",
      "odd": "debe ser un número non",
      "record_invalid": "La validación falló: %{errors}",
      "taken": "ya ha sido tomado",
      "too_long": {
        "one": "es demasiado largo (máximo 1 caracter)",
        "other": "es demasiado largo (máximo %{count} caracteres)"
      },
      "too_short": {
        "one": "es demasiado corto (mínimo 1 caracter)",
        "other": "es demasiado corto (mínimo %{count} caracteres)"
      },
      "wrong_length": {
        "one": "longitud errónea (debe ser de 1 caracter)",
        "other": "longitud errónea (debe ser de %{count} caracteres)"
      }
    },
    "template": {
      "body": "Revise que los siguientes campos sean válidos:",
      "header": {
        "one": "%{model} no pudo guardarse debido a 1 error",
        "other": "%{model} no pudo guardarse debido a %{count} errores"
      }
    }
  },
  "evaluate": {
    "course": {
      "activity": "Actividades para calificar hoy",
      "activity_for_days": "Actividades para calificar en 3 dias o más",
      "activity_for_tmrw": "Actividades para calificar mañana",
      "all": "Todas las actividades de tu curso estan calificadas, puedes ver",
      "no_activity": "No tienes actividades por calificar.",
      "past_activity": "actividades pasas en la seccion de Pasadas"
    },
    "course_inactive": {
      "enrollment": "Necesitas estar inscrito en al menos un curso para tener calificaiones.",
      "no_score": "Aún no tienes calificaciones."
    },
    "deliveries": {
      "delivery_user_response": {
        "attachments": "Archivos adjuntos",
        "check_hmwrk": "Calificar tarea",
        "comments": "Envia comentarios en base a los criterios de la actividad.",
        "deliver": "Entrega",
        "deliveries": "Entregas",
        "delivery": "Entregado",
        "example": "Ejemplo",
        "feedback": "Retroalimentación",
        "message": "Mensaje",
        "no_score": "Sin Calificar",
        "score": "Calificación:",
        "scored": "Calificar",
        "student": "Alumno",
        "title": "Titulo"
      },
      "evaluate_deliveries": {
        "deliveries": "Entregas",
        "no_deliveries": "Sin Entregas.",
        "no_deliveries_record": "Todavia no hay ninguna entrega en esta tarea.",
        "no_score": "Sin calificar",
        "score": "Calificación:"
      }
    },
    "discussions": {
      "discussion_user_response": {
        "comments": "Comentarios",
        "example": "Ejemplo",
        "feedback": "Retroalimentación",
        "no_score": "Sin Calificar",
        "rate_student": "Calificar alumno",
        "score": "Calificación",
        "send": "Envia comentarios en base a los criterios de la actividad."
      },
      "evaluate_discussions": {
        "comment": "Comentario",
        "comments": "Comentarios",
        "discuss": "Discusión",
        "nothing": "Nadie a participado en esta discusión."
      },
      "evaluate_discussions_header": {
        "course": "Curso",
        "limit_publish_date": "Fecha limite para participar",
        "members": "Participantes",
        "publish_date": "Fecha de publicación"
      }
    },
    "inactive": {
      "no_act": "No has creado ninguna actividad.",
      "no_activity": "No tienes actividades pasadas."
    },
    "index": {
      "all": "Todas las actividades de tu curso están calificadas, puedes ver",
      "no_score": "No tienes actividades por calificar.",
      "past": "actividades pasadas en la sección de Pasadas",
      "someday": "Actividades para calificar en 3 días o más",
      "today": "Actividades para calificar hoy",
      "tomorrow": "Actividades para calificar mañana"
    },
    "shared": {
      "delivery_activity": {
        "delivery": "Entregas",
        "of": "de"
      },
      "discussion_activity": {
        "members": "Participantes",
        "of": "de"
      },
      "discussions_sidebar_responses": {
        "members": "Participantes",
        "no_score": "Sin Calificar"
      },
      "evaluate_course_filter": {
        "all": "Todos los cursos"
      },
      "evaluation_criterium_feedback": {
        "feedback": "Retroalimentación"
      },
      "header_activity_delivery": {
        "course": "Curso",
        "delivery": "Entregas",
        "publish_date": "Fecha de publicación",
        "publish_date_of": "Fecha para entrega"
      },
      "header_activity_survey": {
        "answered": "Contestados",
        "attemps": "Ver los intentos",
        "course": "Curso",
        "deliver_date": "Fecha para entrega",
        "of": "de",
        "publish_date": "Fecha de publicación",
        "the": "del"
      },
      "header_evaluate": {
        "active": "Activas",
        "evaluate": "Calificar Actividades",
        "past": "Pasadas"
      },
      "survey_activity": {
        "answered": "Contestados"
      }
    },
    "survey_attemps": {
      "attemps": "Registro de intentos",
      "new_attemp": "Generar nuevo intento",
      "new_attemp_notice": "Al agregar este intento eliminaras la calificación anterior del cuestionario."
    },
    "surveys": {
      "evaluate_surveys": {
        "delivery": "Entregas",
        "no_answer": "Todavia ningún alumno ha contestado este cuestionario.",
        "no_deliveries": "Sin Entregas.",
        "obtain": "Obtenido"
      },
      "survey_user_response": {
        "answers": "Respuestas",
        "comments": "Envia comentarios al alumno.",
        "delivery": "Entregas",
        "feedback": "Retroalimentación",
        "obtain": "Obtenido",
        "reply": "Respuesta",
        "send": "Enviar comentario"
      }
    }
  },
  "evaluate_controller": {
    "correct": "Calificación asignada correctamente.",
    "error": "Ha ocurrido un error al calificar la discusión.",
    "no_activity": "Estas tratando de ver una actividad que no te pertenece.",
    "no_calificable": "La discusión que intentas ver no es calificable.",
    "no_evaluate": "Estas tratando de calificar un curso que no te pertenece.",
    "no_exist": "La discusión que intentas ver no existe o ah sido borrada.",
    "only_teachers": "Estas intentando entrar en una sección solo para profesores.",
    "send_comment": "Comentario enviado correctamente."
  },
  "evaluation_criteria": {
    "form": {
      "eval": "¿Que criterio se evaluará?"
    },
    "form_course": {
      "eval": "¿Qué se va evaluar?"
    }
  },
  "formtastic": {
    "cancel": "Cancelar",
    "create": "Guardar %{model}",
    "false": "No",
    "required": "requerido",
    "reset": "Restablecer %{model}",
    "submit": "Aceptar",
    "true": "Sí",
    "update": "Guardar %{model}"
  },
  "friendships": {
    "new_friendship": "Has agregado un nuevo amigo",
    "send_friendship": "Se ha enviado una solicitud de amistad"
  },
  "friendships_controller": {
    "delete_usr": "Se ha eliminado al usuario de tus amigos",
    "error_usr": "Error al eliminar al usuario de tus amigos"
  },
  "google_forms": {
    "shared": {
      "card": {
        "edit_form": "Editar Formulario",
        "view_form": "Ver Formulario"
      },
      "dropdown": {
        "courses": "Cursos",
        "create_course": "Crear curso",
        "dropdown_v": {
          "no_course": "No has creado ningún curso"
        },
        "public": "Público",
        "return": "Regresar"
      },
      "form": {
        "cancel": "Cancelar",
        "dates": "Fechas:",
        "deliver_day": "Fecha de entrega",
        "descrip": "Descripción: ",
        "form_descrip": "Descripción del formulario",
        "form_url": "URL del formulario",
        "public": "Público",
        "publish": "Publicar",
        "publish_date": "Día de publicación",
        "roles": "Roles: ",
        "title": "Título: ",
        "title2": "Titulo del formulario"
      },
      "google_form_modal": {
        "in_the_course": " en el curso",
        "the_form": "El formulario ",
        "was_created": " fue creado por"
      }
    },
    "success_form": "Formulario creado exitosamente"
  },
  "groups": {
    "edit": {
      "name": "Nombre",
      "update": "Actualizar"
    },
    "new": {
      "create": "Crear",
      "name": "Nombre"
    }
  },
  "helpers": {
    "select": {
      "prompt": "Por favor selecciona"
    },
    "submit": {
      "create": "Crear %{model}",
      "helpers": null,
      "submit": "Guardar %{model}",
      "update": "Actualizar %{model}"
    }
  },
  "home": {
    "about_us": {
      "about_title": {
        "text1": "Cúrsame es una plataforma educativa  fundada en México a finales de 2011 por un grupo de estudiantes de diversas universidades del país con el objetivo de mejorar la calidad educativa y reducir la brecha digital a través de la tecnología. Durante este periodo hemos logrado beneficiar a más de 100 mil estudiantes, profesores y directivos tanto de escuelas públicas como privadas en México, con visión de impactar en toda la región y demás países emergentes.",
        "text2": "Hemos recibido 3 rondas de inversión privada por parte de reconocidos fondos, también nos han otorgado una gran cantidad de premios y reconocimientos pero más importante aún, hemos logrado vincularnos con autoridades gubernamentales en proyectos de alto impacto que nos han permitido crecer de una manera bastante acelerada e impactar socialmente.",
        "title": "Acerca de Nosotros"
      },
      "description1_mission": "Mejorar la calidad de la educación en México a través  de una herramienta tecnológica  eficiente que permita  a la comunidad educativa redefinir estrategias de mejora en los procesos de enseñanza-aprendizaje en las que se complementen y favorezcan las dinámicas del aula y puedan ampliarse fuera de la escuela.",
      "description1_objetives": "Contribuir a lograr mejores resultados en el aprendizaje de los alumnos y en la inclusión digital de maestros, alumnos y miembros de su familia en México.",
      "description1_philosophy": "En Cúrsame partimos de la concepción de que el aprendizaje  no sólo es construido dentro y por la propia persona, sino que  tiene que ver con aspectos más sociales dentro de comunidades de enseñanza.",
      "description2_mission": "Democratizar el acceso a tecnología educativa de calidad y generar un cambio en la vida diaria y profesional de alumnos y profesores al acercarlos a la tecnología y sus beneficios.",
      "description2_objetives": "Promover intercambios de conocimiento  en comunidades de aprendizaje a través de la diversificación de canales de comunicación que facilitan el flujo de información desde el enfoque por competencias.",
      "description2_philosophy": "Para nosotros la posibilidad de interactuar con otros con un fin educativo a través de herramientas tecnológicas es una forma muy eficaz de favorecer los espacios de encuentro efectivo y positivo en el proceso de enseñanza-aprendizaje.",
      "description3_objetives": "Mejorar los tiempos efectivos de clase haciendo más eficiente la gestión  y el seguimiento de actividades educativas.",
      "description4_objetives": "Permitir el acceso a educación de calidad y tecnología educativa a todos las instituciones educativas, sus profesores y alumnos sin importar su situación económica y social.",
      "description_vision": "Ser una plataforma líder en el ámbito educativo que  permita a la población mexicana insertarse con éxito en la sociedad de la información y el conocimiento.",
      "mission": "Misión:",
      "objectives": "Objetivos:",
      "our_team": {
        "description": "Cúrsame está conformado por un grupo apasionado de emprendedores, tenemos como meta común generar un impacto positivo en la sociedad a través de la educación y la tecnología.",
        "title": "Nuestro equipo"
      },
      "philosophy": "Filosofía:",
      "vision": "Visión:"
    },
    "apps": {
      "text1": "Descarga nuestras Apps",
      "text2": "No te pierdas ninguna de tus actividades escolares.",
      "text3": "Próximamente"
    },
    "chat": {
      "add_friends": "Agrega a tus amigos en la sección de",
      "community": "Comunidad",
      "courses": "Cursos",
      "create": "Crear curso ahora →",
      "cursos": "Cursos",
      "friends": "Amigos",
      "no_create": "No has creado ningún curso todavia.",
      "no_friends": "No tienes amigos.",
      "no_member": "No eres miembro de ningún curso.",
      "offline_usr": "Usuario desconectado",
      "online_usr": "Usuario conectado",
      "section": "Únete a uno en la sección de"
    },
    "contact": {
      "contact_page": {
        "text1": "Llena el siguiente formulario y nos pondremos en contacto contigo en menos de 48 horas.",
        "text2": "Campos con asterisco",
        "text3": "son requeridos."
      },
      "contact_title": {
        "description": "¿Tienes alguna sugerencia, te gustaría unirte a nuestro equipo o simplemente quieres decir hola? Nos encantaría escucharte.",
        "title": "Contáctanos"
      }
    },
    "delete_publication": "Se ha borrado correctamente la publicación.",
    "demo": "Solictud de demo",
    "edit_comment": "Comentario editado correctamente.",
    "features": {
      "features_content": {
        "characteristic_chat": "Algunas de sus características son:",
        "characteristic_comment": "Algunas de sus características son:",
        "characteristic_discussion": "Algunas de sus características son:",
        "characteristic_homework": "Algunas de sus características son:",
        "characteristic_network": "Algunas de sus características son:",
        "characteristic_result": "Algunas de sus características son:",
        "characteristic_statisdic": "Algunas de sus características son:",
        "characteristic_survey": "Algunas de sus características son:",
        "chat": "Chat",
        "comments": "Comentarios",
        "description_chat": "Cada usuario puede utilizar un canal de chat con sus amigos y compañeros. Además cada curso tiene una sala de chat grupal para compartir contenido en tiempo real.",
        "description_comment": "Permite a todos los miembros de la comunidad comentarse de manera pública, grupal o personal para de esta forma interactuar social o académicamente.",
        "description_discussion": "Los usuarios pueden crear foros de discusión con contenido recomendado y promover la participación de toda la comunidad en el aprendizaje.",
        "description_homework": "Permite a los profesores crear actividades académicas y a los estudiantes responderlas desde cualquier lugar sin necesidad de utilizar papel y aumentando la productividad de ambos.",
        "description_network": "Todos los usuarios tienen un perfil y pueden ver e interactuar con los de sus amigos promoviendo la interacción social dentro de la institución.",
        "description_result": "Cada usuario puede ver su avance educativo. Los profesores visualizan los resultados de todos sus alumnos de una manera muy sencilla y en tiempo real.",
        "description_statisdic": "Los administradores de la institución tienen acceso a un panel de estadísticas que les permite conocer lo que está sucediendo dentro del plantel y con esto tomar decisiones importantes con conocimiento de causa.",
        "description_survey": "A través de los cuestionarios los profesores pueden evaluar a sus alumnos de manera fácil y automática sin tener que perder tiempo calificando reactivos o desperdiciando papel al imprimir los exámenes.",
        "discussions": "Discusiones",
        "feature1_chat": "Chat individual con amigos y compañeros",
        "feature1_comment": "Públicos o privados",
        "feature1_discussion": "Públicas o privadas",
        "feature1_homework": "Creación a uno o varios cursos",
        "feature1_network": "Encontrar amigos",
        "feature1_result": "Calificaciones por curso",
        "feature1_statisdic": "Uso de las herramientas de la plataforma",
        "feature1_survey": "Creación en uno o varios cursos",
        "feature2_chat": "Salas de chat grupal por curso",
        "feature2_comment": "A uno o varios cursos",
        "feature2_discussion": "A uno o varios cursos",
        "feature2_homework": "Fecha límite y hora de entrega",
        "feature2_network": "Encontrar compañeros de clase y profesores",
        "feature2_result": "Calificaciones individuales",
        "feature2_statisdic": "Ingreso al sistema",
        "feature2_survey": "Fecha y hora límite de entrega",
        "feature3_chat": "Compartir multimedia",
        "feature3_comment": "Contenido enriquecido (multimedia)",
        "feature3_discussion": "Contenido recomendado",
        "feature3_homework": "Archivos adjuntos",
        "feature3_network": "Solicitudes de amistad",
        "feature3_result": "Calificaciones por actividad",
        "feature3_statisdic": "Calificaciones",
        "feature3_survey": "Preguntas y respuestas ilimitadas",
        "feature4_chat": "Mensajes privados",
        "feature4_homework": "Contenido recomendado",
        "feature4_network": "Interacción en perfiles",
        "feature4_result": "Exportar a PDF",
        "feature4_statisdic": "Por curso",
        "feature4_survey": "Autoevaluación",
        "feature5_homework": "Rubros de evaluación",
        "feature5_statisdic": "Por alumno",
        "homeworks": "Tareas",
        "network": "Comunidad",
        "results": "Calificaciones",
        "statisdics": "Estadísticas:",
        "surveys": "Cuestionarios"
      },
      "features_icons": {
        "chat": "Chat",
        "comments": "Comentarios",
        "discussions": "Discusiones",
        "homeworks": "Tareas",
        "network": "Comunidad",
        "results": "Calificaciones",
        "statisdics": "Estadisticas",
        "surveys": "Cuestionarios"
      },
      "features_title": {
        "text1": "Ofrecemos herramientas, capacitación y seguimiento a instituciones educativas para mejorar la interacción en el proceso de enseñanza y aprendizaje.",
        "title1": "Metodología"
      },
      "our_methods": {
        "description_endless": "Buscamos siempre estar en contacto con nuestros usuarios para que juntos podamos mejorar la plataforma, conocer sus necesidades y enfocarnos en satisfacerlas para su mayor beneficio.",
        "description_implement": "Tenemos un equipo especializado que está dedicado a visitar los planteles para enseñar a los maestros y directivos toda la funcionalidad de la plataforma y los beneficios que esta conlleva.",
        "description_support": "En Cúrsame estamos cerca de los usuarios de la plataforma para orientarlos y auxiliarlos en caso de que sea necesario. Apoyamos con soporte vía chat, tickets y video tutoriales de uso en todo momento.",
        "description_title": "Nuestra metología toma en cuenta que una plataforma tecnológica por sí misma no es suficiente para satisfacer las necesidades de alumnos, profesores y directivos. Por esta razón trabajamos mano a mano con ellos para lograr los mejores resultados.",
        "description_training": "Antes de comenzar a usar Cúrsame capacitamos tecnológicamente a las instituciones que lo requieran. Combatimos así la Brecha Digital y apoyamos a los profesores en la adopción de las TICs.",
        "endless": "Seguimiento",
        "implement": "Implementación",
        "support": "Soporte",
        "title": "No sólo es la tecnología",
        "training": "Capacitación"
      }
    },
    "help": {
      "help2": "Ayuda",
      "videos": "Video tutoriales en linea."
    },
    "jobs": {
      "job_board": {
        "apply_for_job": "¡Aplicar para esta vacante!",
        "description1_senior_developer": "Para poder seguir ofreciendo la mejor plataforma educativa del mercado a nuestros usuarios e impactar positivamente en la calidad educativa de nuestro país, buscamos tener siempre el mejor equipo de desarrollo.",
        "description2_senior_developer": "Buscamos un perfil con experiencia en manejo de equipos de desarrollo.",
        "implementation": "Implementación",
        "offer1_senior_developer": "+ Sueldo competitivo con el mercado (a negociar).",
        "offer2_senior_developer": "+ Prestaciones de Ley.",
        "offer3_senior_developer": "+ Gran ambiente de trabajo.",
        "offer4_senior_developer": "+ Bonos conforme a resultados.",
        "offer5_senior_developer": "+ Oportunidad de trabajar en una empresa con un potencial de crecimiento enorme y de cambiar la vida de millones de personas.",
        "requeriment1_senior_developer": "+ Al menos 3 años de experiencia en desarrollo de software as a service.",
        "requeriment2_senior_developer": "+ Al menos 2 años de experiencia desarrollando en Ruby, RoR, Phyton o Meteor JS.",
        "requeriment3_senior_developer": "+ Ganas de cambiar el mundo.",
        "requeriments": "Requerimientos:",
        "responsabilities": "Responsabilidades:",
        "responsibility1_senior_developer": "+ Planeación y ejecución del Road Map de desarrollo de la plataforma y nuevos productos.",
        "responsibility2_senior_developer": "+ Establecer metodologías de trabajo ágiles para el equipo de desarrollo.",
        "responsibility3_senior_developer": "+ Organización de los roles trabajo de los miembros del equipo para cubrir las áreas de necesidad.",
        "responsibility4_senior_developer": "+ Participar en la creación de código para el back end de la plataforma.",
        "vacancies": "Vacantes",
        "we_offer": "Ofrecemos:"
      },
      "jobs_title": {
        "text1": "Estamos Transformando la Educación en México.",
        "text2": "¿Te gustaría trabajar con nosotros?",
        "title": "Empleos"
      }
    },
    "landing_page": {
      "cursame_stats": {
        "success_stories_path": "Proyectos",
        "title1": "Usuarios beneficiados",
        "title2": "Instituciones usando Cúrsame",
        "title3": "Actividades en toda la República Mexicana"
      },
      "features_showcase": {
        "features_path": "Conoce nuestra metodología",
        "text1": "Es muy fácil y rápido aprender a utilizar Cúrsame. Gracias a su diseño y funciones fomenta la adopción por parte de los usuarios.",
        "text2": "Nuestras Herramientas aumentan la productividad y reducen la carga de trabajo para profesores, alumnos y directivos.",
        "text3": "Cúrsame puede utilizarse desde cualquier computadora o dispositivo móvil, esto permite crear y consultar contenido a cualquier hora y lugar.",
        "title1": "Fácil de usar",
        "title2": "Funciones simples y poderosas",
        "title3": "Multiplataforma"
      },
      "intro_homepage_hidden": {
        "request_demo": "¡Solicita un demo en tu plantel!",
        "text1": "Cúrsame es una plataforma que conecta profesores, alumnos y directivos de una misma institución.",
        "title1": "Interactúa social y académicamente mejorando los procesos de aprendizaje y la calidad educativa"
      },
      "social_impact": {
        "description": "Buscamos generar un impacto positivo en la sociedad a través de mejorar la calidad educativa, reducir la brecha digital y detectar oportunamente los focos rojos en comunidades estudiantiles.",
        "header": "Compromiso e impacto social",
        "text1_1": "Seguimiento personalizado del avance educativo de los estudiantes.",
        "text1_2": "Con apoyo de nuestros aliados llevamos servidores y tabletas a las escuelas que más lo necesitan.",
        "text1_3": "A través de diversos indicadores apoyamos en la detección de: Riesgo de deserción escolar.",
        "text2_1": "Entrega contenido especializado de acuerdo a las necesidades individuales.",
        "text2_2": "Apoyamos a los profesores con capacitación y asesoría tecnológica.",
        "text2_3": "Consumo de sustancias.",
        "text3_1": "Aumenta la productividad y permite potenciar la enseñanza y mejorar el aprendizaje.",
        "text3_2": "La plataforma promueve el intercambio digital de contenido educativo.",
        "text3_3": "\"Bullying” escolar.",
        "title1": "Mejora la calidad educativa",
        "title2": "Reduce la brecha digital",
        "title3": "Detección oportuna de focos rojos"
      },
      "testimonials": {
        "description1": "Cúrsame ha sido una herramienta fundamental en el desarrollo y complemento del día a día en el salón de clases, aumenta el tiempo efectivo en el aula, además nos ayuda a montar programas de lectura y ahorro de papel, lo cual es un gran beneﬁcio.",
        "description2": "He utilizado un sin número de LMS’s, y Cúrsame es la plataforma educativa que mejor se ha adaptado al entorno académico real. Su facilidad de uso y factor social ha provocado que nuestros maestros lo adopten y usen en su trabajo escolar diario beneﬁciando a miles de alumnos.",
        "description3": "La mejor herramienta para la educación. En nuestra experiencia en Media Superior y Superior hemos tenido  el reto de implementar tecnología para la enseñanza sin haber tenido mucho éxito hasta que comenzamos a trabajar con Cúrsame, los resultados han sido bastante satisfactorios.",
        "header": "Testimoniales",
        "name1": "Lic. Francisco Fabián Brizuela",
        "name2": "Lic. Alejandro Caballero",
        "name3": null,
        "title1": "Director del Centro de Innovación Tecnológica Educativa Secundarias Técnicas Distrito Federal",
        "title2": "Subdirector Académico Universidad Tecnológica Emiliano Zapata",
        "title3": "Asesora en Secretaría de Educación Pública - Subsecretaría de Educación Media Superior"
      },
      "user_roles_types": {
        "description": "Pensamos y diseñamos herramientas para los maestros, alumnos, directivos y padres de familia de tu comunidad escolar.",
        "header": "Toda tu institución en un sólo lugar",
        "text1": "Toma el control de tu institución con estadísticas en tiempo real y sistemas de comunicación.",
        "text2": "Convierte tus clases en una comunidad de aprendizaje, ahorra tiempo y potencia tus capacidades de enseñanza de una forma social.",
        "text3": "Interactúa con tus compañeros y profesores. Resuelve tus dudas, aprende y haz tus entregas en cualquier hora y lugar.",
        "text4": "Mantente al día de las actividades y avances escolares de cada uno de tus hijos en tiempo real.",
        "title1": "Directivos",
        "title2": "Maestros",
        "title3": "Alumnos",
        "title4": "Padres"
      }
    },
    "like": "Me gusta",
    "load_more_notfications": {
      "load_more_notifications": "Ver más notificaciones"
    },
    "login_form": {
      "log_in": "Iniciar Sesión",
      "pwd": "Olvidé mi contraseña",
      "remember": "Recordarme"
    },
    "mkt_pages": {
      "ad01": {
        "form": "Llena el siguiente formulario y nos pondremos en contacto contigo.",
        "text1": "Las demandas profesionales de la economía global y la sociedad de la información requieren del dominio de herramientas socioculturales para interactuar con conocimientos, tales como el lenguaje y la información; al mismo tiempo requieren de las herramientas físicas, tales como las computadoras, móviles y dispositivos con interfaces cada día más complejas. Usar las herramientas de forma interactiva requiere de algo más que el simple acceso a la herramienta y la destreza técnica requerida para manejar la situación. Los alumnos también necesitan crear y adaptar el conocimiento y las destrezas.",
        "text2": "Hoy se reconoce que las tecnologías de la información y la comunicación ofrecen muchas posibilidades para apoyar los procesos de enseñanza-aprendizaje. Favorecen la motivación, el interés por la materia, la creatividad, la imaginación y los métodos de comunicación, mejoran la capacidad para resolver problemas y el trabajo en grupo, refuerzan la autoestima y permiten mayor autonomía de aprendizaje.",
        "text3": "es una plataforma educativa integral que contribuye a lograr mejores resultados en el aprendizaje de los alumnos y en la inclusión digital de maestros, alumnos y miembros de su familia.",
        "text4": "Su principal característica es que retoma aspectos de los Sistemas de Gestión de Aprendizajes (Learning Activity Management System) y de las redes sociales y los integra en una sola plataforma, facilitando los flujos de información, los intercambios de conocimiento y el trabajo colaborativo a través de comunidades de aprendizaje.",
        "tool": "Herramientas del futuro en la educación de hoy"
      },
      "mkt_thanks": {
        "agent": "Uno de nuestros agentes se comunicará contigo lo más pronto posible.",
        "thnks": "¡Gracias por contactarnos!"
      }
    },
    "new_comment": "Se ha creado un comentario",
    "not_found": {
      "not_found2": "Lo sentimos, no encontramos la ruta",
      "return": "Regresar al inicio"
    },
    "press": {
      "text1": "Prensa",
      "text2": "Lo que se dice en medios sobre Cúrsame."
    },
    "privacidad": {
      "best_product": "Mejora del producto.",
      "description1_who_are_we": "Redes Sociales de Aprendizaje SAPI de CV, mejor conocido como Cúrsame",
      "description2_who_are_we": ", con domicilio en",
      "description3_who_are_we": "calle Pomona 7, colonia Roma Norte, ciudad DF, municipio o delegación Cuauhtémoc, c.p. 06100, en la entidad de México DF, país México , y portal de internet",
      "description4_who_are_we": "es el responsable del uso y protección de sus datos personales, y al respecto le informamos lo siguiente:",
      "personal_data1": "¿Para qué fines utilizaremos sus datos personales?",
      "personal_data2": "De manera adicional, utilizaremos su información personal para las siguientes finalidades secundarias que&nbsp;",
      "personal_data3": "no son necesarias",
      "personal_data4": "&nbsp;para el servicio solicitado, pero que nos permiten y facilitan brindarle una mejor atención",
      "personal_data5": "En caso de que no desee que sus datos personales sean tratados para estos fines secundarios, desde este momento usted nos puede comunicar lo anterior a través del siguiente mecanismo",
      "personal_data6": "Para conocer mayor información sobre los términos y condiciones en que serán tratados sus datos personales, como los terceros con quienes compartimos su información personal y la forma en que podrá ejercer sus derechos ARCO, puede consultar el aviso de privacidad integral en",
      "privacy": "¿Dónde puedo consultar el aviso de privacidad integral?",
      "service": "La negativa para el uso de sus datos personales para estas finalidades no podrá ser un motivo para que le neguemos los servicios y productos que solicita o contrata con nosotros.",
      "support": "A través de nuestro soporte en línea o escribiendo a",
      "title": "AVISO DE PRIVACIDAD",
      "who_are_we": "¿Quiénes somos?"
    },
    "request_demo": {
      "text1": "Un asesor especializado visitará tu plantel para demostrar la plataforma y resolver todas tus dudas.",
      "text2": "Llena el siguiente formulario y nos pondremos en contacto contigo en menos de 48 horas.",
      "text3": "Campos con asterisco",
      "text4": "son requeridos.",
      "title": "Solicitar Demo"
    },
    "send": "¡Tu mensaje se ha enviado!",
    "server_error": {
      "conti": "Debido a una contingencia",
      "info": "no es posible mostrar esta información",
      "return": "Regresar al inicio"
    },
    "success_stories": {
      "stories_list": {
        "cobaem": "COBAEM",
        "description_cobaem": "Tras un piloto con 6 planteles del Colegio de Bachilleres de Estado de México, nos encontramos en etapa de expansión y serán 48 planteles en más de 40 municipios de la entidad y 50 mil usuarios los beneficiados por Cúrsame.",
        "description_emprendedores": "Proyecto en conjunto con la Subsecretaría de Educación Media Superior, Angel Ventures y Ashoka. A través de Cúrsame se imparte educación para emprendedores en 100 planteles de preparatoria de todo el país y actualmente en expansión para llegar a 1000 planteles en 2014.",
        "description_pilot_tablets": "Actualmente participamos en la licitación / piloto Federal que se realiza en Morelos, Guanajuato y Querétaro para educación con tabletas en primarias del país. Somos parte de dos de las 5 propuestas finalistas (IUSA y HP).",
        "description_tecnica_df": "Trabajamos con un piloto de 6 planteles tras el cual estamos en proceso de expansión con un universo de 120 planteles  en todo el Distrito Federal.",
        "emprendedores": "Modelo de Emprendedores de Educación Media Superior",
        "pilot_tablets": "Piloto Federal educación con tabletas",
        "schools": "Planteles:",
        "students": "Alumnos:",
        "teachers": "profesores:",
        "tecnica_df": "Secundarias Técnicas del DF",
        "testimonial": "Testimonio",
        "testimonial_emprendedores": "“La mejor herramienta para la educación. En nuestra experiencia en Media Superior y Superior hemos tenido  el reto de implementar tecnología para la enseñanza sin haber tenido mucho éxito hasta que comenzamos a trabajar con Cúrsame, los resultados han sido bastante satisfactorios.”",
        "testimonial_emprendedores_name": "Lic. Katia Águila",
        "testimonial_emprendedores_title": "Asesora en Secretaría de Educación Pública - Subsecretaría de Educación Media Superior",
        "testimonial_tecnica_df": "\"Cúrsame ha sido una herramienta fundamental en el desarrollo y complemento del día a día en el salón de clases, aumenta el tiempo efectivo en el aula, además nos ayuda a montar programas de lectura y ahorro de papel, lo cual es un gran beneﬁcio.\"",
        "testimonial_tecnica_df_name": "Lic. Francisco Fabián Brizuela",
        "testimonial_tecnica_df_title": "Director del Centro de Innovación Tecnológica Educativa Secundarias Técnicas Distrito Federal"
      },
      "success_stories_title": {
        "description_success_stories": "Trabajamos con una gran cantidad de instituciones educativas, aquí mostramos algunos de los casos más relevantes.",
        "success_stories": "Proyectos"
      }
    },
    "teacher_day": {
      "happy": "¡Feliz día del Maestro!",
      "text1": "En Cúrsame estamos muy orgullosos de tí y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text2": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text3": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Maestro ¡Te lo mereces!"
    },
    "terms_and_conditions": {
      "terms": "Términos y condiciones del sitio",
      "terms1": "Nuestros servicios están disponibles solamente para los individuos y las empresas del marco educativo (que incluyen pero no restringidos a estos, a las de propietario único) en correcta situación legal que puede firmar contratos legalmente obligatorios y se den derecho a suscribir y tener acceso a nuestros servicios bajo la legislación aplicable. Por lo que el cliente garantiza que está bajo la jurisdicción legal del país al que pertenece y bajo la normatividad del mismo. En consecuencia, el cliente garantiza que está autorizado para hacer negocios y está en correcta situación legal en las jurisdicciones en las cuales hace el negocio (durante el término de este acuerdo), que no es un competidor de Cúrsame, y que la persona que acepta este acuerdo tiene por lo menos dieciocho años de la edad y está capacitado y autorizado para asumir las obligaciones contractuales como cliente.",
      "terms10f": "Tipo de indemnización.",
      "terms10x": "Cúrsame solo indemnizara al usuario en especie, no en ninguna forma monetaria, solo mediante la extensión del tiempo que haya sido contratado el servicio, según el tiempo que haya fallado el mismo.",
      "terms1f": "Requerimientos para tener acceso a los Servicios de Cúrsame.",
      "terms2": "Conforme a los términos y condiciones del presente Acuerdo, Cúrsame se compromete a brindar ciertos Servicios al Cliente. Para los efectos del presente Acuerdo: (a) \"Cliente\" (o \"usted\") se refiere al individuo o a la entidad comercial que utiliza o se registró para utilizar dichos Servicios, incluyendo a sus empleados y agentes; (b) \"Servicios\" de Cúrsame se refiere a todos los servicios interactivos o electrónicos ofrecidos por Cúrsame. Cúrsame Online se reserva el derecho de modificar o interrumpir la prestación de sus Servicios en cualquier momento.",
      "terms2f": "Servicios de Cúrsame.",
      "terms3": "Reconoce que el contenido (excepto el que se carga en Cúrsame) de esta página Web, incluyendo pero no limitándose a información, documentos, productos, logotipos, elementos gráficos y sonidos, gui, software y servicios (llamados colectivamente \"Materiales\"), es provisto por Cúrsame o por sus respectivos autores, diseñadores y vendedores (llamados colectivamente \"Proveedores\") y que Cúrsame y/o sus Proveedores se reservan todos los derechos de propiedad inherentes al mismo. Los elementos de la página Web están protegidos por las leyes aplicables al secreto comercial (trade dress) y por otras leyes que no pueden copiarse ni imitarse en su totalidad o en parte. Cúrsame, el logotipo de Cúrsame y otros productos a los que se hace referencia en el presente son marcas de Cúrsame y pueden estar registradas en ciertas jurisdicciones. Cualquier otro nombre de producto, nombre de la empresa, marcas, logotipos y símbolos pueden ser las marcas comerciales de sus propietarios respectivos.",
      "terms3f": "Propiedad",
      "terms4": "El Cliente reconoce y garantiza que la información que proporciona a Cúrsame en los formularios de información de contacto es verdadera, precisa, actual y completa. El Cliente acuerda mantener y actualizar dicha información para asegurar dichas condiciones. En el caso de que dicha información fuera incorrecta, imprecisa, desactualizada o incompleta, Cúrsame tendrá el derecho de suspender o terminar la cuenta del Cliente y el presente acuerdo.",
      "terms4f": "Información del Cliente",
      "terms5": "El Cliente puede designar a personas como sus agentes para que utilicen los Servicios, siempre que cada persona designada tenga la capacidad legal para realizar acuerdos de cumplimiento obligatorio para el Cliente. Además, el Cliente representa y garantiza que cada persona que se registra con la cuenta del Cliente es un agente autorizado del Cliente (un \"Usuario Autorizado\") que tiene dicha capacidad legal.",
      "terms51": "Usuarios autorizados",
      "terms52": "Responsabilidad de Acceso",
      "terms53": "Responsabilidad por los ID y contraseñas del usuario",
      "terms53x": "El Cliente es el único responsable de mantener la confidencialidad de la información de acceso del Cliente, es decir, IDs y contraseñas de acceso a las cuentas de sus Usuarios Autorizados, y es responsable de todas las actividades que ocurren en su cuenta.",
      "terms54": "Notificación de uso no autorizado",
      "terms54x": "El Cliente debe informarle inmediatamente a Cúrsame si nota cualquier actividad que indicara que su cuenta o información está siendo usada sin autorización, incluyendo: (a) El Cliente recibe la confirmación de una o más órdenes realizadas a través de su cuenta que en realidad nunca realizó o cualquier otro informe conflictivo similar; o (b) el Cliente nota el uso no autorizado de cualquier producto o servicio relacionado con su(s) cuenta(s).",
      "terms5f": "Cuenta del Cliente (membresía de maestro Cúrsame)",
      "terms5x": "El Cliente es el único responsable del acceso y uso de los Servicios (incluyendo todas las actividades y transacciones) por parte de cualquier Usuario Autorizado y/o ID del Usuario registrado bajo la cuenta del Cliente, a menos que dicho acceso o uso de los Servicios sea resultado directo de negligencia por parte de Cúrsame. Es responsabilidad del Cliente, a través de su Usuario Autorizado que administra sus sistemas, permitir el acceso apropiado a cualquiera de los Usuarios Autorizados del Cliente.",
      "terms61f": "Circunstancias especiales",
      "terms61x": "Cúrsame permitirá el acceso a los Servicios y a la información del Cliente a cualquier agente del Cliente (\"Agente Autorizado\") que presente a Cúrsame una carta notariada firmada por un funcionario del Cliente. Dicha carta deberá incluir declaraciones de autenticidad, autorización, y responsabilidad como lo estipula Cúrsame a su sola discreción. El cliente acuerda de forma expresa e irrevocable que Cúrsame puede confiar en dicha carta y en la autorización aparente de esa persona que solicita el acceso a los Servicios o a la cuenta del Cliente. Cúrsame no será responsable ante el Cliente o cualquier tercero por la veracidad de dicha carta o autoridad.",
      "terms6f": "Información del Cliente",
      "terms6x": "El Cliente es el único responsable por la información que almacena en los servidores de Cúrsame. El Cliente controla su información a través de su enlace generado. Cúrsame recomienda a los Clientes que archiven su información de manera regular y frecuente; el Cliente tiene absoluta responsabilidad de archivar su información y será el único responsable por información perdida o irrecuperable. El Cliente acuerda cumplir con las obligaciones legales concernientes a su información. Cúrsame eliminará información del Cliente una vez finalizado el presente Acuerdo. Sin embargo, Cúrsame puede llegar a retener información del Cliente en sus archivos luego de eliminarlo y no será responsable en lo absoluto por dicha información.",
      "terms7": "Uso aceptable",
      "terms71": "Ilegalidad/ Contenido adulto",
      "terms71f": "Cúrsame sanciona y no permite el contenido del sitio o la transmisión de información que contenga material obsceno o ilegal o fomente o promueva actividad ilegal, incluyendo pero no limitándose a juegos, venta de armas ilegales, y la promoción o publicación de cualquier material que pueda violar la legislación de delitos hostiles.",
      "terms71x": "Cúrsame se reserva el derecho a suspender o rescindir inmediatamente y sin previo aviso cualquier cuenta o transmisión que viole esta política. Asimismo, si el Cliente violara esta política, Cúrsame asistirá y cooperará activamente con las agencias policiales y las autoridades gubernamentales al recolectar y ofrecer información sobre el Cliente, el sitio del Cliente, el contenido obsceno o ilegal, y de aquellas personas que puedan haber accedido, adquirido o utilizado de manera inapropiada contenido obsceno o ilícito.",
      "terms72": "Conducta ilícita",
      "terms72x": "El Cliente no cometerá o permitirá la realización de actos dañinos o ilícitos que justifiquen la acción civil, que incluya pero no se limite a la publicación de información privada, escandalosa o difamatoria acerca de una persona sin su consentimiento o que causare intencionalmente angustia emocional.",
      "terms73": "Se prohíben estrictamente las violaciones o intentos de violaciones de los sistemas de Cúrsame, o la interrupción de sus servicios. Dicha violación puede resultar en responsabilidad civil y penal. Sin limitación, los ejemplos de violaciones del sistema incluyen",
      "terms73f": "Acceso e interferencia",
      "terms73x": "Acceso sin autorización o uso de los Servicios de Cúrsame, incluyendo cualquier intento de sondeo, copia o prueba de vulnerabilidad de un sistema o la violación de medidas de seguridad o autenticación sin autorización expresa de Cúrsame; o b) Interferencia con el Servicio a cualquier cliente o sistema, incluyendo, sin limitación, congestión o intento deliberado de sobrecargar un sistema y ataques explícitos; o c) Utilización de cualquier dispositivo, software, o rutina que interfiera o intente interferir con el correcto funcionamiento de los Servicios; o d) Cualquier acción que imponga una carga desproporcionada o inmoderada para la infraestructura de Cúrsame",
      "terms73x1": "El Cliente no deberá desarmar, desmontar, decodificar, extraer, revertir la ingeniería o de otra forma intentar derivar el código fuente del \"software\" (incluyendo los dispositivos, métodos, procesos, e infraestructura) que sustentan los Servicios o cualquier otro software en el sitio Web de Cúrsame. 8.4 Violación de derecho de autor o marca registrada Los Servicios de Cúrsame se pueden utilizar únicamente con propósitos legales. Se prohíbe la transmisión, distribución o almacenamiento de cualquier material en violación a cualquier ley vigente o regulación, incluyendo la exportación de leyes de control. Esto incluye, sin limitación, material protegido por patente, derecho de autor, marca registrada, marca identificada de servicios, secreto de fabricación, u otros derechos de propiedad intelectual. Si utiliza material de terceros, deberá obtener autorización previa. Al utilizar los Servicios, usted representa y garantiza ser el autor y dueño de derechos de autor y/o titular de la licencia con respecto a cualquier contenido alojado y, asimismo, representa y garantiza que ningún contenido viola la marca registrada o los derechos de terceros. Cúrsame se reserva el derecho de suspender o rescindir la(s) transmisión(es) que, a su criterio, violan estas políticas o violan alguna ley o regulación.",
      "terms75": "Mal uso de los recursos del sistema",
      "terms75f": "El Cliente no deberá hacer mal uso de los recursos, que incluyan pero que no se limiten a, empleo del contenido que consume excesivo tiempo en el CPU o espacio de almacenamiento; utilización excesiva de la banda ancha; o reventa del acceso al contenido alojado en los servidores de Cúrsame.",
      "terms76": "Otras actividades",
      "terms76f": "Ya sea lícito o ilícito, Cúrsame se reserva el derecho a determinar qué es perjudicial para sus Clientes, operaciones o reputación, incluyendo actividades que restrinjan o inhiban a algún otro usuario del uso o placer de disfrutar el Servicio o Internet.",
      "terms76x": "Por favor, sea consciente que Cúrsame se reserva el derecho de supervisar, suspender, restringir, suprimir, modificar, o terminar cualquier contenido o transmisión de la cuenta que se considere viola cualquiera de las políticas anteriormente dichas. Si se da el caso, Cúrsame formulará las denuncias pertinentes a las autoridades responsables de la aplicación de la ley, y en tal caso, Cúrsame ayudará activamente a las entidades responsables de aplicar la ley y con la investigación y el proceso de cualquier actividad, incluyendo la entrega de las cuentas de los clientes y de sus datos personales.",
      "terms76x1": "Las quejas sobre violadores de nuestra Política deben enviarse por correo electrónico a politicasvioladas@cursa.me . Se investigará cada queja y puede resultar en la inmediata cancelación de los Servicios, sin previo aviso.",
      "terms7ax": "cargar, publicar, enviar por correo electrónico, transmitir u ofrecer de otra manera cualquier Contenido que propague mensajes de terror o describa tortura o muerte; si es un caso muy serio, se informará a la autoridad legal competente y/o se contactará al correspondiente proveedor de Internet;",
      "terms7bx": "perjudicar a menores, esto incluye cualquier forma de pornografía infantil; si es un caso muy serio, se informará del contenido a la autoridad legal competente y/o se contactará al correspondiente proveedor de Internet; se prohibe publicar cualquier tipo de pornografía.",
      "terms7cx": "cargar, publicar, enviar por correo electrónico u ofrecer de otra manera cualquier Contenido que viole la patente, marca registrada, secreto de fabricación, derecho de autor u otros derechos propietarios de cualquier parte.",
      "terms7dx": "Envío masivo de correo no solicitado (\"Spam\"). Se prohíbe el envío de cualquier forma de Spam a través de los servidores de Cúrsame. Asimismo, también se prohíbe el uso de cualquier recurso de el sitio web de Cúrsame para el envío de Spam de otro proveedor de servicio, anuncio de un sitio Web, o dirección de correo. Las cuentas o los servicios de Cúrsame no pueden ser usados para solicitar información/respuestas de los clientes, mediante mensajes enviados desde otro ISP (Proveedor de Servicios de Internet) donde esos mensajes puedan violar esta política de uso o la del otro proveedor.",
      "terms7ex": "El anuncio, transmisión, o cualquier otra manera de hacer accesible, o el uso de cualquier programa, producto o servicio que esté diseñado para violar los términos y las condiciones de este acuerdo o del uso aceptable de este u otro ISP, incluyendo, aunque de forma no limitada a, facilitar los medios de envío de Spam, iniciación de operaciones de ping, avalancha, bombardeo de correo, o negación de ataques al servicio;",
      "terms7fx": "Reenvío a usuarios de Internet de cualquier sitio web que, si ese sitio web contase con soporte de Cúrsame, supondría la violación de los términos de este acuerdo;",
      "terms7gx": "proveer anonimato a actividades ilegales, fraudulentas o que violen los derechos de propiedad intelectual de una tercera parte;",
      "terms7hx": "conociendo o deliberadamente permitiendo a otros el uso de los servicios de Cúrsame: (i) para cualquier actividad ilegal, invasiva, fraudulenta, difamatoria, o con propósito fraudulento; (ii) para alterar, robar, corromper, inhabilitar, destruir, violar o penetrar en cualquier sistema de seguridad o cifrado de cualquier fichero electrónico, base de datos o red; (iii) para materialmente interferir el uso de la red de Cúrsame de otros clientes o usuarios autorizados; (iv) en violación de las políticas de uso aceptable aplicables al uso de los proveedores de servicios nucleares de Cúrsame, y considerando que usted está avisado de tales políticas o tales políticas está disponibles en lugares públicos de los sitios web de tales proveedores; o (v) de manera que, en opinión de Cúrsame, es contraria a las reglas generalmente aceptadas de etiqueta y de la buena conducta en Internet;",
      "terms7ix": "intentar obtener acceso a otra cuenta o recurso de otro ordenador de propiedad ajena sin autorización del legítimo dueño (por ejemplo \"hacking\");",
      "terms7jx": "obtener o intentar servicios por otros medios o usando dispositivos con la intención de intentar no pagar;",
      "terms7kx": "participar en actividades diseñadas para molestar o que puedan suponer la negación del servicio (por ejemplo ataques sincronizados) a otros usuarios, ya sea en la red de Cúrsame o en la de cualquier otro ISP (Proveedor de Servicios de Internet);",
      "terms7lx": "interferir con el uso o disfrute de la red Cúrsame u otros servicios por parte de otros clientes o usuarios autorizados, incluyendo el uso excesivo de los servicios impidiendo el uso equitativo por parte de otros usuarios de Cúrsame.",
      "terms7mx": "exponer a los proveedores, representantes, directivos, empleados, agentes, asociados o accionistas de Cúrsame a escrutinio público, ridículo o difamación;",
      "terms7nx": "suplantar a cualquier persona o entidad, incluyendo, aunque sin limitarse a ellos, a representantes de Cúrsame, así como falsamente afirmar o inducir a interpretaciones erróneas sobre su personalidad o afiliación a personas o entidades;",
      "terms7ox": "importar de forma paralela cualquier copia de obras con derechos de propiedad intelectual protegida con el objeto de venderla, alquilarla, etc. por provecho, recompensa y/o.",
      "terms7px": "importar o poseer cualquier importación paralela de copias de obras con derechos de propiedad intelectual protegidas, tales como, películas, series de televisión o grabaciones musicales para su reproducción o visionado público, incluyendo, aunque sin limitación, locales de karaoke, restaurantes, tiendas, etc.",
      "terms7x": "Usted acuerda no utilizar los servicios de Cúrsame para",
      "terms8": "Limitación de la responsabilidad",
      "terms8x": "Usted usa Cúrsame bajo su propia responsabilidad. Si usted no está satisfecho con cualquier aspecto de nuestro servicio o con estos términos y condiciones, o algunas otras reglas o políticas, su única solución es finalizar el uso del servicio. Usted explícitamente entiende y acepta que Cúrsame no será responsable por cualquier daño directo, daños accidentales indirectos, fortuitos, especiales, consecuentes, incluyendo pero no limitados a, los daños por la pérdida de beneficios, buena voluntad, uso, datos u otras pérdidas intangibles (incluso si le hemos advertido sobre la posibilidad de tales daños), resultando de: (a) el uso o la incapacidad para utilizar el servicio; (b) el coste de obtención mercancías o servicios alternativos resultado de cualquier mercancía, dato, información comprados o obtenidos o mensajes recibidos o transacciones realizadas en o mediante este servicio; (c) acceso desautorizado a o alteración de sus transmisiones o datos; (d) declaraciones o actuaciones de cualquier tercer parte en el servicio; o (e) cualquier otra asunto relativo al servicio.",
      "terms9f": "Limitación de la responsabilidad de protección a contenidos.",
      "terms9x": "xCúrsame no indemnizará al usuario en fallo del sistema, perdida de su información, jaqueo, destrucción de su información voluntariamente, intento de daño de otro usuario, uso de su información para daño físico, uso de su información para daño moral, uso de su información para cualquier tipo de violación a la ley. No nos hacemos responsables del uso que se le dé a sus contenidos en la red."
    },
    "thnx": "Gracias por usar Cúrsame.",
    "unlike": "Ya no me gusta",
    "wall": {
      "comment": "Comentar"
    }
  },
  "layouts": {
    "sessions": {
      "help": "Ayuda"
    },
    "static_pages": {
      "first_column": {
        "title1": "Cúrsame",
        "title10": "Blog",
        "title2": "Metodología",
        "title3": "Proyectos",
        "title4": "Nosotros",
        "title5": "Prensa",
        "title6": "Empleos",
        "title7": "Contacto",
        "title8": "Solicitar Demo",
        "title9": "Aplicaciones"
      },
      "fourth_column": {
        "title1": "Derechos reservados © 2014 Cúrsame",
        "title2": "Ver la página en ingles"
      },
      "second_column": {
        "title1": "Ayuda",
        "title2": "Centro de ayuda",
        "title3": "Aviso de Privacidad",
        "title4": "Términos y Condiciones"
      },
      "third_column": {
        "title1": "Síguenos en"
      }
    },
    "super_admin": {
      "activities": "Actividades",
      "admin": "administración",
      "admin_net": "Administrar redes",
      "course_admin": "Administrador de cursos",
      "hello": "hola",
      "statics": "Estadísticas",
      "super_adm": "Super admins",
      "usr": "Usuarios"
    }
  },
  "libraries": {
    "new": {
      "new_library": "Nueva Biblioteca"
    },
    "shared": {
      "card": {
        "view_files": "Ver Archivos"
      },
      "header": {
        "create_folder": "Crear Carpeta",
        "library": "Biblioteca",
        "upload_file": "Subir Archivo"
      },
      "library_files": {
        "no_documents": "No hay documentos."
      }
    }
  },
  "library_directories": {
    "shared": {
      "form": {
        "descrip": "Descripción: ",
        "lib_descrip": "Descripción de la biblioteca",
        "lib_name": "Titulo de la biblioteca",
        "name": "Nombre: ",
        "send": "Enviar"
      },
      "header": {
        "create_folder": "Crear Carpeta",
        "library": "Biblioteca",
        "upload_file": "Subir Archivo"
      },
      "list": {
        "no_documents": "No hay documentos."
      },
      "standalone_card": {
        "open_folder": "Abrir Carpeta"
      }
    }
  },
  "library_files": {
    "new": {
      "upload_file": "Subir Archivo"
    },
    "shared": {
      "card": {
        "download_file": "Descargar Archivo"
      },
      "form": {
        "descrip": "Descripción: ",
        "descrip_file": "Descripción del Archivo",
        "file": "Archivo",
        "file_name": "Titulo del Archivo: ",
        "file_name2": "Titulo del Archivo",
        "send": "Enviar"
      },
      "standalone_card": {
        "download_file": "Descargar Archivo"
      }
    }
  },
  "managers": {
    "bit": {
      "error_connection": "Ocurrio un error, no se pudo acceder a la información de bit",
      "error_course": "Ocurrio un error al crear el curso.",
      "error_user": "No se pudo guardar a el usuario: ",
      "success_importing_group": "Grupo importado correctamente, Se ha creado el curso."
    },
    "comments": {
      "index": {
        "actions": "Acciones",
        "comment": "Comentario",
        "comment_in": "Comentario en",
        "comments1": "Comentarios",
        "confirm": "Estas seguro de borrar este comentario.",
        "course": "Curso",
        "create_date": "Fecha de creación",
        "delete": "Borrar",
        "discuss": "Discusión",
        "hmwrk": "Tarea",
        "like": "Me gusta",
        "no_user": "No tiene usuario",
        "public": "Publico",
        "quest": "Cuestionario",
        "user": "Usuario",
        "view": "Ver"
      },
      "show": {
        "author": "Autor",
        "back": "← Regresar",
        "comment": "Comentario",
        "comment_in": "Comentario en",
        "confirm": "Estas seguro de borrar este comentario.",
        "course": "Curso",
        "create_date": "Fecha de Creación",
        "delete": "Borrar",
        "discuss": "Discusión",
        "hmwrk": "Tarea",
        "like": "Me Gusta",
        "public": "Publico",
        "quest": "Cuestionario",
        "user": "Usuario"
      }
    },
    "correct_course": "Curso creado correctamente",
    "correct_deleted": "Comentario borrado correctamente",
    "course_delete": "Curso borrado correctamente.",
    "course_error1": "Ocurrio un error al crear el curso",
    "course_error2": "Ocurrio un error al crear el curso",
    "course_error3": "Ocurrio un error al editar el curso",
    "course_error4": "Ocurrio un error al borrar el curso",
    "courses": {
      "edit": {
        "edit1": "Editar Curso"
      },
      "index": {
        "actions": "Acciones",
        "courses": "Cursos",
        "create": "Crear curso",
        "delete": "Borrar",
        "edit": "Editar",
        "inte_date": "Fecha de creación",
        "name": "Nombre",
        "students": "Estudiantes",
        "sure": "Estas seguro de borrar este curso.",
        "teachers": "Profesores"
      },
      "new": {
        "create_course": "Crear Curso"
      },
      "shared": {
        "form": {
          "add": "Agrega profesores al curso.",
          "cancel": "Cancelar",
          "create": "Crear Curso",
          "descrip": "Descripción",
          "enroll": "Inscribe estudiantes a tu curso.",
          "example": "Ejemplo",
          "example2": "Matemáticas I",
          "find": "Busca profesores para administrar el curso.",
          "find2": "Busca estudiantes para unirlos automaticamente al curso.",
          "init_date": "Fecha de Inicio",
          "init_date2": "Fecha inicio",
          "last_name": "Escribe un nombre o apellido.",
          "name": "Nombre",
          "privacy": "Privacidad",
          "private": "Privado",
          "public": "Público",
          "save": "Guardar cambios",
          "students": "Alumnos",
          "teachers": "Profesores",
          "write_name": "Escribe un nombre o apellido."
        },
        "managers_courses_subnav": {
          "list": "Listado"
        }
      },
      "show": {
        "comments": "Comentarios",
        "create_date": "Fecha de Creación",
        "delete": "Borrar",
        "descrip": "Descripción",
        "edit": "Editar",
        "files": "Archivos",
        "hmwrks": "Tareas",
        "quest": "Cuestionarios",
        "return": "← Regresar",
        "students": "Alumnos",
        "sure": "Estas seguro de borrar este curso.",
        "teachers": "Maestros"
      }
    },
    "create": "Usuario creado correctamente.",
    "delete_content": "El contenido fue borrado correctamente.",
    "delete_discuss": "Discusión borrada correctamente.",
    "delete_error": "Ocurrió un error al borrar el comentario",
    "delete_report": "El reporte fue borrado correctamente.",
    "delete_success_usr": "Usuario borrado correctamente",
    "delete_test": "Cuestionario borrado correctamente.",
    "deliveries": {
      "index": {
        "actions": "Acciones",
        "course": "Curso",
        "delete": "Borrar",
        "end_date": "Fecha de finalización",
        "hmwrks": "Tareas",
        "init_date": "Fecha de creación",
        "name": "Nombre",
        "no_user": "No tiene usuario",
        "published": "Publicada",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta tarea.",
        "unpublished": "Sin Publicar",
        "user": "Usuario",
        "view": "Ver"
      },
      "show": {
        "course": "Curso",
        "delete": "Borrar",
        "descrip": "Descripción",
        "end_date": "Fecha de finalización",
        "init_date": "Fecha de Creación",
        "published": "Publicada",
        "return": "← Regresar",
        "state": "Estado",
        "sure": "Estas seguro de borrar este cuestionario.",
        "teacher": "Maestro",
        "unpublished": "Sin Publicar"
      }
    },
    "discussions": {
      "index": {
        "actions": "Acciones",
        "course": "Curso",
        "delete": "Borrar",
        "discuss": "Discusiones",
        "eval": "Evaluable",
        "init_date": "Fecha de creación",
        "name": "Nombre",
        "non_eval": "No Evaluable",
        "published": "Publicada",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta discusión.",
        "type": "Tipo",
        "unpublished": "Sin Publicar",
        "view": "Ver"
      },
      "show": {
        "course": "Curso",
        "delete": "Borrar",
        "descrip": "Descripción",
        "eval": "Evaluable",
        "init_date": "Fecha de Creación",
        "non_eval": "No Evaluable",
        "public": "Publica",
        "published": "Publicada",
        "return": "← Regresar",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta discusión.",
        "teacher": "Maestro",
        "type": "Tipo",
        "unpublished": "Sin Publicar"
      }
    },
    "edit_correct": "Curso editado correctamente",
    "edit_error": "Error al editar el usuario",
    "error_delete_user": "Error al borrar el usuario",
    "error_user": "Ocurrio un error al crear el usuario",
    "file": "Tipo de archivo no soportado",
    "hmwrk_delete": "Tarea borrada correctamente.",
    "import_members": {
      "course": "Course",
      "download": "Descargar archivo de cursos",
      "import1": "Importar miembros",
      "import2": "Importa los miembros de los cursos desde una base de datos.",
      "import3": "Importar lista de usuarios",
      "import4": "¿Importar?",
      "list": "Lista donde se puede importar.",
      "no_file": "NO SE ENCONTRO EL ARCHIVO",
      "text1": "Es importante tomar en cuenta que el formato del archivo es fundamental para importar correctamente los cursos.",
      "text2": "Propietario solo puede ser 0 o 1, donde 0 es para referirse a que aquel usuario sera el dueño del curso mientras que 1 es para especificar que solo es un miembro del curso nada más.",
      "text3": "El Email debe de ser el correo asociado al usuario."
    },
    "index": {
      "actual": "Actual",
      "comments": "Comentarios",
      "courses": "Cursos",
      "discuss": "Discusiones",
      "exams": "Examenes",
      "hmwrks": "Tareas",
      "pop": "Población esperada",
      "stat": "Estadisticas",
      "usr": "Usuarios"
    },
    "mailer": {
      "example": "Ejemplo",
      "example2": "Ceremonia de clausura",
      "masive": "Mail Masivo",
      "masive2": "Envía un mail a todos los miembros de tu comunidad.",
      "msg": "Mensaje",
      "send": "Enviar",
      "subject": "Asunto"
    },
    "menu": {
      "admin": "Administración",
      "config": "Configuración",
      "import_cur": "Importar cursos",
      "import_std": "Importar alumnos de curso",
      "import_usr": "Importar usuarios",
      "masive": "Correo Masivo",
      "usr": "Usuarios"
    },
    "no_delete": "No puedes borrar este usuario.",
    "no_edit": "No puedes editar ese usuario.",
    "proc_file": "Tu archivo esta siendo procesado, recibiras un correo electrónico de confirmación",
    "reported_contents": {
      "index": {
        "actions": "Acciones",
        "author": "Autor",
        "delete_content": "Borrar Contenido",
        "delete_report": "Borrar Reporte",
        "report_content": "Contenidos Reportados",
        "report_date": "Fecha de reporte",
        "sure": "¿Está seguro de borrar este contenido?",
        "sure2": "¿Está seguro de borrar este reporte?, el contenido no será borrado.",
        "usr": "Usuario",
        "view": "Ver"
      }
    },
    "settings": {
      "config": "Configuración"
    },
    "shared": {
      "managers_sidebar": {
        "comments": "Comentarios",
        "config": "Configuración",
        "courses": "Cursos",
        "discuss": "Discusiones",
        "hmwrk": "Tareas",
        "masive": "Correo Masivo",
        "quest": "Cuestionarios",
        "report_content": "Contenido Reportado",
        "stat": "Estadisticas",
        "usr": "Usuarios"
      },
      "managers_user_header": {
        "admin": "Administrador",
        "edit": "Editar perfil",
        "exit": "Salir del administrador",
        "help": "Ayuda",
        "log_out": "Cerrar sesión"
      }
    },
    "success_usr": "Usuario editado correctamente",
    "surveys": {
      "index": {
        "actions": "Acciones",
        "course": "Curso",
        "delete": "Borrar",
        "end_date": "Fecha de finalización",
        "init_date": "Fecha de creación",
        "name": "Nombre",
        "no_user": "No tiene usuario",
        "published": "Publicada",
        "quest": "Cuestionarios",
        "state": "Estado",
        "sure": "Estas seguro de borrar este cuestionario.",
        "unpublished": "Sin Publicar",
        "user": "Usuario",
        "view": "Ver"
      },
      "show": {
        "course": "Curso",
        "delete": "Borrar",
        "end_date": "Fecha de finalización",
        "init_date": "Fecha de creación",
        "return": "← Regresar",
        "state": "Estado",
        "sure": "Estas seguro de borrar esta tarea.",
        "teacher": "Maestro"
      }
    },
    "users": {
      "edit": {
        "edit1": "Editar Usuario"
      },
      "import": {
        "download": "Descargar archivo de usuarios",
        "import2": "Importar Usuarios",
        "import3": "Importa los usuarios de tu comunidad desde una base de datos.",
        "import4": "Es importante tomar en cuenta que el formato del archivo es fundamental para importar correctamente los usuarios.",
        "import5": "Importar archivo de usuarios",
        "no_find": "NO SE ENCONTRO UN ARCHIVO",
        "text1": "El role puede ser estudiante o maestro.",
        "text2": "El email debe de ser el email del usuario."
      },
      "index": {
        "actions": "Acciones",
        "create": "Crear usuario",
        "delete": "Borrar",
        "edit": "Editar",
        "email": "Correo electrónico",
        "enroll": "Fecha de registro",
        "name": "Nombre",
        "sure": "Estas seguro de borrar este usuario.",
        "type": "Tipo de usuario",
        "usr": "Usuarios",
        "view": "Ver"
      },
      "new": {
        "create": "Crear Usuario"
      },
      "shared": {
        "form": {
          "admin": "Administrador",
          "cancel": "Cancelar",
          "create": "Crear Usuario",
          "email": "Correo electrónico",
          "last_names": "Apellidos",
          "name": "Nombre(s)",
          "pwd": "Contraseña",
          "save": "Guardar cambios",
          "student": "Alumno",
          "teacher": "Profesor",
          "type": "Tipo de usuario"
        },
        "managers_users_subnav": {
          "import": "Importar",
          "list": "Listado"
        }
      },
      "show": {
        "bio": "Biografia",
        "delete": "Borrar",
        "deliveries": "Tareas entregadas",
        "edit": "Editar",
        "email": "Correo electrónico",
        "eval": "Participación en discusiones evaluables",
        "info": "Si información",
        "last": "Ultimo inicio de sesión",
        "quest": "Cuestionarios contestados",
        "return": "← Regresar",
        "sure": "Estas seguro de borrar este usuario.",
        "type": "Tipo de usuario"
      }
    }
  },
  "managers_controller": {
    "in_stack": "Su correo se ha puesto en cola para enviar."
  },
  "members_in_courses": {
    "create": {
      "enrolled": "Te has inscrito",
      "request_send": "Solicitud enviada"
    }
  },
  "messages": {
    "index": {
      "no_member": "No eres parte del grupo!",
      "send": "Enviar Mensaje"
    }
  },
  "messages_controller": {
    "no_send": "No puedes enviar correo a los estudiantes del curso"
  },
  "modal": {
    "delivery_modal": {
      "hmwrk_not_found": "La tarea que tratas de ver ya no existe, ponte en contacto con el profesor del curso."
    },
    "discussion_modal": {
      "discussion_not_found": "La discusión que tratas de ver ya no existe, ponte en contacto con el profesor del curso."
    },
    "google_form_modal": {
      "form_not_found": "El formulario que tratas de ver ya no existe, ponte en contacto con el profesor del curso."
    },
    "reported_content_modal": {
      "publ_not_found": "La publicación que tratas de denunciar ya no existe."
    },
    "survey_modal": {
      "no_modal_found": "El cuestionario que tratas de ver ya no existe, ponte en contacto con el profesor del curso."
    }
  },
  "networks": {
    "alertmethod": {
      "net": "Ir a la red a la que pertenezco",
      "text1": "Se ha encontrado que usted no es miembro de la red a al que intenta acceder, lo redireccionaremos a una red de la cual usted sea miembro, después de esto usted deberá loguearse."
    },
    "awaiting_confirmation": {
      "email": "Revisa tu correo electrónico",
      "log_in": "Inicia sesión",
      "send": "Se han enviado las instrucciones para activar tu cuenta."
    },
    "create": "Se ha creado una red.",
    "form": {
      "api_key": "API Key:",
      "authorization_keyword": "Palabra clave",
      "example": "Ejemplo: ",
      "form": "Habilitar formulario de registro publico.",
      "icon": "Imagen de inicio de sesión",
      "icon2": "Logo de la institución",
      "label": "Etiquetas",
      "msg": "Mensaje de bienvenida",
      "name": "Nombre",
      "net_evaluable": "Habilitar evaluables de la red. (Tareas, Cuestionarios y Discusiones evaluables)",
      "pop": "Población",
      "pwd": "Reestablecer contraseña al importar los usuarios",
      "save": "Guardar cambios",
      "subdomain": "Subdominio"
    },
    "index": {
      "new": "Nueva red"
    },
    "messages": {
      "search": {
        "network": "Buscador de Redes"
      },
      "update": {
        "success": "Configuración guardada correctamente."
      }
    },
    "network_mask": {
      "enroll": "Registrar usuario"
    },
    "new": {
      "new_net": "Crear nueva red"
    }
  },
  "networks_users": {
    "index": {
      "no_members": "no hay miembros en esta red",
      "records": "Usuarios registrados en el sistema"
    },
    "new": {
      "accept": "Acepto las normas y condiciones de esta plataforma",
      "select": "Selecciona un rol",
      "sign_in": "Ingresar a la plataforma",
      "suscribe": "suscribirme a la red"
    }
  },
  "notifier": {
    "accepted_message": {
      "accept": "Has sido aceptado en el curso",
      "button": "Si el botón superior no funciona, haz click aquí",
      "hello": "¡Hola"
    },
    "csv_import_email": {
      "error": "¡Error!",
      "hello": "¡Hola",
      "results": "Te anexamos los resultados de la importación de usuarios",
      "success": "Exito"
    },
    "masive_mailer_for_super_admin": {
      "user": "Estimados usuarios de Cúrsame"
    },
    "new_delivey_notification": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "course_notif": "Tarea en el curso",
      "deliver": "Entregar antes del"
    },
    "new_discussion_notification": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "discuss": "Discusión en el curso"
    },
    "new_member_in_course": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "course": "Desea formar parte de tú curso"
    },
    "new_survey_notification": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "deliver": "Entregar antes del",
      "hmwrk": "Tarea en el curso"
    },
    "send_comment_on_course": {
      "button": "Si el botón superior no funciona, haz click aquí",
      "comment": "comentó en un comentario en el curso",
      "comment2": "comentó en el curso"
    },
    "send_contact_mail": {
      "contact": "Contacto Normal",
      "demo": "Solicitud de Demo",
      "ext": "Extensión",
      "msg": "Mensaje",
      "name": "Nombre",
      "other": "Otro",
      "pos": "Posicion",
      "school": "Escuela",
      "tel": "Telefono"
    },
    "send_email": {
      "msg": "Mensaje del administrador de la red",
      "net": "Ir a la red"
    },
    "send_email_members_in_course": {
      "net": "Ir a la red",
      "notif": "Notificación"
    },
    "send_import_courses": {
      "error": "Error",
      "line": "Linea",
      "no_error": "No hubo errores"
    },
    "send_import_members": {
      "course": "Curso",
      "error": "Error",
      "line": "Linea",
      "no_error": "No hubo errores"
    },
    "send_import_users": {
      "error": "Error",
      "line": "Linea"
    },
    "user_mailer_with_password": {
      "accept": "has sido aceptado aceptado en Cúrsame.",
      "active": "Activado",
      "hello": "Hola",
      "net": "Ir a la red",
      "text1": "puedes cambiarla al iniciar sessión.",
      "text2": "Si no puedes ver este mail,",
      "text3": "haz click aquí.",
      "text4": "¡Feliz día del Maestro!",
      "text5": "En Cúrsame estamos muy orgullosos de tí y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text6": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text7": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Maestro ¡Te lo mereces!",
      "welcome": "Bienvenido",
      "your_pwd": "Tu constraseña es"
    }
  },
  "number": {
    "currency": {
      "format": {
        "delimiter": ",",
        "format": "%u%n",
        "precision": 2,
        "separator": ".",
        "significant": false,
        "strip_insignificant_zeros": false,
        "unit": "$"
      }
    },
    "format": {
      "delimiter": ",",
      "precision": 2,
      "separator": ".",
      "significant": false,
      "strip_insignificant_zeros": false
    },
    "human": {
      "decimal_units": {
        "format": "%n %u",
        "units": {
          "billion": "mil millones",
          "million": "millón",
          "quadrillion": "mil billones",
          "thousand": "mil",
          "trillion": "billón",
          "unit": ""
        }
      },
      "format": {
        "delimiter": ",",
        "precision": 3,
        "significant": true,
        "strip_insignificant_zeros": true
      },
      "storage_units": {
        "format": "%n %u",
        "units": {
          "byte": {
            "one": "Byte",
            "other": "Bytes"
          },
          "gb": "GB",
          "kb": "KB",
          "mb": "MB",
          "tb": "TB"
        }
      }
    },
    "percentage": {
      "format": {
        "delimiter": ","
      }
    },
    "precision": {
      "format": {
        "delimiter": ","
      }
    }
  },
  "polls": {
    "answer_fields": {
      "answer": "Ingresar respuesta",
      "correct": "¿Es la respuesta correcta?",
      "delete": "Eliminar"
    },
    "edit": {
      "edit": "Editando Encuesta"
    },
    "index": {
      "list": "Lista de Encuestas"
    },
    "question_fields": {
      "add": "Agregar Respuesta",
      "delete": "Eliminar",
      "quest": "Ingresar pregunta"
    }
  },
  "publications": {
    "discussion_template": {
      "discuss": "ha inicidado una discusión",
      "in_course": "en el curso"
    }
  },
  "registrations": {
    "edit": {
      "bios": "Biografía",
      "cancel": "Cancelar mi cuenta",
      "cancel2": "Cancelar",
      "confirm": "¿Estas seguro de que quieres darte de baja de Cúrsame?",
      "dir": "Dirección",
      "down": "¿Quieres darte de baja?",
      "edit": "Editar Perfil",
      "email": "Correo electrónico",
      "example": "Ejemplo",
      "last_name": "Apellido",
      "name": "Nombre",
      "pwd": "Escribe tu contraseña para guardar",
      "text1": "Recuerda no colocar espacios ni simbolos como",
      "text2": "ya que no se aceptará tu url",
      "update": "Actualizar perfil"
    },
    "edit_user": {
      "back": "Regresar",
      "cancel": "Cancela tu cuenta",
      "down": "¿Quieres darte de baja?",
      "edit": "Editar Usuario",
      "update": "Actualizar"
    },
    "new": {
      "accept": "Acepto los",
      "confirm_pwd": "Confirmar contraseña",
      "confirm_pwd2": "Confirmacion de contraseña",
      "email": "Correo electrónico",
      "last_name": "Apellidos:",
      "name": "Nombre(s)",
      "pwd": "Contraseña",
      "sign_in": "Registrarme",
      "student": "Regístrate Alumno",
      "teacher": "Regístrate Profesor",
      "terms": "Términos y Condiciones",
      "text1": "Lo sentimos pero la red a la que estas intentado no permite el registro público. pregunta a un encargado de tu escuela él sabrá ayudarte.",
      "text2": "Ir a la página principal",
      "type": "Tipo de usuario"
    },
    "send_confirmation": {
      "send_confirmation": "Se envio la confirmacion"
    }
  },
  "registrations_controller": {
    "error": "El perfil no pudo actualizarce correctamente",
    "update": "Se a actualizado correctamente tu perfil"
  },
  "reported_contents": {
    "denounce_fail": "Algo sucedió que no se pudo guardar tu denuncia.",
    "denounce_success": "Tu denuncia ha sido realizada con éxito.",
    "shared": {
      "reported_content_modal": {
        "comment": "Escribe un comentario",
        "help_us": "Ayúdanos a entender qué sucede",
        "reported_content": "Ya has reportado este contenido, el administrador de la red tomará acciones.",
        "send": "Enviar",
        "why_no_content": "¿Por qué no quieres ver este contenido?"
      }
    }
  },
  "shared": {
    "assets_for_assignments": {
      "new_assets": {
        "attach_file": "Adjuntar archivo"
      }
    },
    "assets_form": {
      "new_assets": {
        "file": "Archivo"
      }
    },
    "chat": {
      "add_message_form": {
        "msg": "Escribe un mensaje y presiona Enter."
      },
      "chat": {
        "more_msg": "Cargar más mensajes...",
        "select": "Selecciona a un amigo o curso para enviar mensaje."
      },
      "load_more_messages": {
        "more_msg": "Cargar más mensajes..."
      },
      "message_notifications": {
        "ago": "Hace",
        "all_msg": "Ver todos los mensajes",
        "msg": "Mensajes"
      },
      "message_tpl": {
        "ago": "hace"
      }
    },
    "comment": {
      "comment_main": {
        "like": "me gusta"
      }
    },
    "comment_form": {
      "file": "Archivo",
      "new_publication": {
        "cancel": "Cancelar",
        "comment": "Comentar",
        "file": "Archivo",
        "public": "Público",
        "save": "Guardar"
      }
    },
    "comments": {
      "publication_box": {
        "more_comments": "cargas mas comentarios",
        "twlv_likes": "12 Likes",
        "twty_comments": "20 Comentarios"
      }
    },
    "course_joyride": {
      "joyRideTipContent": {
        "content_area": "Esta es el área de creación de contenido.",
        "course_descrip": "Aquí va la descripción del curso.",
        "course_edit": "Editar el curso",
        "create_content": "Creación de contenido",
        "descrip": "Descripción",
        "ed_course": "Aquí puedes editar el curso.",
        "edit_course": "Editar el curso",
        "friends": "Amigos",
        "friends_list": "Aquí encontrarás un listado de tus amigos",
        "notif": "Notificaciones",
        "notif_area": "Esta es el área de notificaciones.",
        "profile": "Perfil",
        "pub_area": "Aquí encontrarás todas las publicaciones de la red.",
        "publications": "Publicaciones",
        "sub_profile": "Este es el perfil del curso.",
        "subtitle": "En este lugar podrás ver todo lo que pasa en el curso.",
        "text_edit_course": "Aqui puedes editar el curso.",
        "welcome": "Bienvenido al perfil de curso"
      }
    },
    "delivery_publication_tpl": {
      "category": "rubro",
      "edit_delivery": "Editar Entrega",
      "end_delivery": "Entregar antes de",
      "evaluates": "Se evalua",
      "files": "Archivos",
      "final_eval": "Evaluación final",
      "no_evaluation": "A esta tarea no se le han asignado áreas de evaluación",
      "no_reply": "No se han encontrado respuestas a esta tarea",
      "reply": "Responder",
      "view_delivery": "Ver entrega de tarea"
    },
    "dropdown": {
      "dropdown_v": {
        "courses": "Cursos",
        "goto_section": "Únete a uno en la sección de",
        "new_course": "Crear curso ahora →",
        "no_course": "No has creado ningún curso todavia.",
        "no_member": "No eres miembro de ningún curso.",
        "public": "Público",
        "return": "Volver"
      },
      "return": "Volver"
    },
    "evaluation_criteria": {
      "evaluation_criteria_fields": {
        "criteria_name": "Nombre del criterio a evaluar"
      }
    },
    "form_commentable": {
      "comment": "Comentar",
      "comment_2": "Comentar",
      "write_comment": "Escribe un comentario"
    },
    "network_joyride": {
      "joyride_tip_content": {
        "courses": "Creación de cursos",
        "description": "En este tour te mostraremos el nuevo diseño y las herramientas que podras utilizar dentro de nuestra plataforma.",
        "description_courses": "Al dar click en el bootón Crear (+) aparecera el formulario de creación para los cursos que impartes.",
        "menu": "Menú de creación",
        "menu_description": "En un solo lugar puedes crear Comentarios, Tareas, Discusiones y Cuestionarios.",
        "text1": "Público o a tus cursos",
        "text10": "En esta sección podrás ver a tus amigos, o ingresar a la \"Comunidad\" para agregarlos",
        "text11": "Menú interactivo",
        "text12": "Dependiendo la sección en la que te encuentres este menú mostrará herramientas de utilidad.",
        "text13": "Video tutoriales de ayuda",
        "text14": "En cada sección donde veas un signo de interrogación \"?\", al dar click en el podras ver un video sobre como usar dicha función.",
        "text2": "Podrás escoger si tus publicaciones son públicas para toda la red o para uno o varios de tus cursos.",
        "text3": "Uno o varios cursos",
        "text4": "!Tendrás la posibilidad de escoger si lo que creas pertenece a uno, varios o todos los cursos! .",
        "text5": "Muro principal",
        "text6": "En el muro principal aparecerán todas las publicaciones de tus cursos y amigos.",
        "text7": "Filtrado de publiciones",
        "text8": "Con el menu de filtrado podrás escoger que tipo de publicación quieres ver en el muro.",
        "text9": "Amigos",
        "welcome": "Bienvenido a Cúrsame"
      }
    },
    "notification_type": {
      "activity_feed": {
        "accept_course": "Has sido aceptado en el curso",
        "active": "activado",
        "activities_p_user": "Una actividad por",
        "add_to_course": "ha solicitado entrar al curso",
        "comment_course": "comentó en el curso",
        "comment_net": "comentó en la red",
        "comment_profile": "ha comentado en tu perfil.",
        "comment_to_comment": "ha comentado en un comentario que hiciste.",
        "comment_to_homework": "ha comentado en la tarea",
        "course_calif": "Se ha calificado el curso",
        "course_expired": "ha llegado a su fecha final. Por favor desactívalo.",
        "coursework": "del curso",
        "discuss_comment": "comentó en tu discusión",
        "ended": "finalizado",
        "friend_notif": "ha solicitado ser su amigo",
        "friend_req": "ha aceptado su solicitud de amistad.",
        "homework_calif": "Han calificado tu tarea",
        "in_course": "en tu curso",
        "in_course1": "en tu curso",
        "in_course2": "en tu curso",
        "in_network": "en tu red",
        "lookup_usr": "Ver usuario",
        "new_course": "Nuevo curso",
        "new_discus": "Nueva discusion",
        "new_homework": "Nueva tarea",
        "new_question": "Nuevo cuestionario",
        "one_usr": "Un usuario",
        "quest_feedback": "Has recibido retroalimentación en el cuestionario",
        "quest_response": "ha respondido el cuestionario",
        "response_homework": "ha respondido la tarea",
        "text15": "El curso",
        "text16": "ha sido",
        "text17": "Han calificado tu participacion en la discusión",
        "the_course": "El curso",
        "view_usr": "Ver usuario"
      }
    },
    "notifications": {
      "box_notifications": {
        "more_notif": "Ver más notificaciones",
        "no_notif": "No hay notificaciones para mostrar.",
        "notif": "Notificaciones"
      }
    },
    "post_comments": {
      "comment": "Comentar",
      "comment1": "Comentar",
      "delte": "Borrar",
      "last_comments": "Ver comentarios anteriores",
      "like": "me gusta",
      "write_comment": "Escribe un comentario"
    },
    "post_menu": {
      "comment": "Comentario",
      "discussion": "Discusión",
      "form": "Formulario",
      "homework": "Tarea",
      "post_comment": "Deja un comentario.",
      "questionnaire": "Cuestionario",
      "what_are_y_think": "¿Qué estás pensando?"
    },
    "posts": {
      "post_admin_actions": {
        "confirm_delete": "¿Estás seguro de borrar esto?",
        "delete": "Borrar",
        "edit": "Editar"
      },
      "post_child_comment": {
        "like": "Me gusta",
        "not_like": "Ya no me gusta"
      },
      "post_comments": {
        "comment": "Comentar",
        "delete": "Borrar",
        "like": "me gusta",
        "view_comments": "Ver comentarios anteriores",
        "write_comment": "Escribe un comentario"
      },
      "post_comments_list": {
        "non_commentable": "Esta publicación ya no se puede comentar.",
        "prev_comments": "Comentarios anteriores",
        "write_comment": "Escribe un comentario"
      },
      "post_meta_data": {
        "like": "Me gusta",
        "not_like": "Ya no me gusta"
      },
      "post_people_who_liked": {
        "ed": "A",
        "liked": "les gusta esto"
      }
    },
    "publications": {
      "comment": {
        "course_comment": "comentó en el curso",
        "profile_comment": "comentó en el perfil de",
        "usr": "Usuario"
      },
      "course": {
        "go_course": "Ir al curso",
        "new_course": "Nuevo curso público"
      },
      "delivery": {
        "delivery_txt": "Entregar antes del",
        "new_homework": "Nueva tarea para entregar en el curso",
        "open_hmwk": "Abrir tarea"
      },
      "discussion": {
        "in_course": "en el curso",
        "new": "Nueva discusión",
        "open_discuss": "Abrir discusion"
      },
      "meta_data": {
        "ago": "Hace",
        "at": "a las",
        "comments": "Comentarios",
        "like": "Me gusta"
      },
      "owner_edit_publications": {
        "confirm": "¿Estas seguro de borrar esto?",
        "delete": "Borrar",
        "edit": "Editar"
      },
      "people_who_likes": {
        "users": "Usuarios a los que les gusta esto"
      },
      "publication_comments": {
        "prev_comments": "Ver comentarios anteriores"
      },
      "publication_template": {
        "edit_publ": "Editar publicación"
      },
      "survey": {
        "new_quest": "Nuevo cuestionario para responder en el curso",
        "open_quest": "Abrir cuestionario",
        "question": "Pregunta",
        "questions": "Preguntas",
        "response_before": "Responder antes del"
      }
    },
    "publications_filter": {
      "filter_by_course_publications": {
        "filtrate": "Filtrar",
        "select_course": "Selecciona un curso"
      }
    },
    "sessions": {
      "network_box_head": {
        "log_in": "¿Ya eres usuario? Ingresa →",
        "sign_in": "Registrarme →"
      },
      "network_not_exist": {
        "no_net_exists": "Parece que la red a la que quieres accesar no existe. Pregunta a un encargado de tu escuela él sabrá ayudarte.",
        "no_network": "No ingresaste el subdominio de la red a la que quieres acceder.",
        "ops": "¡Oops!",
        "search_school": "Busca tu escuela aquí →"
      }
    },
    "sidebar": {
      "sidebar_section": {
        "activities": "Actividades",
        "add_friends": "Agrega a tus amigos en la sección de",
        "calendar": "Calendario",
        "chat": "Chat",
        "community": "Comunidad",
        "community_href": "Comunidad",
        "course_href": "Cursos",
        "course_message": "Únete a uno en la sección de",
        "courses": "Cursos",
        "discussion": "Discusiones",
        "disp_usr": "Usuario conectado",
        "friends": "Amigos",
        "goto_section": "Únete a uno en la sección de",
        "homework": "Tareas",
        "initiation": "Inicio",
        "library": "Biblioteca",
        "no_course": "No has creado ningún curso.",
        "no_course_href": "Crear curso ahora →",
        "no_disp_usr": "Usuario desconectado",
        "no_friends": "No tienes amigos.",
        "no_member": "No eres miembro de ningún curso.",
        "questionnaire": "Cuestionarios",
        "radar": "Radar",
        "ratings": "Calificaciones",
        "return": "volver",
        "vLex": "vLex"
      },
      "upcomming_deliveries_widget": {
        "side_section": {
          "pending_homeworks": "Tareas próximas"
        }
      },
      "upcomming_surveys_widget": {
        "side_section": {
          "next_questionnaires": "Cuestionarios próximos"
        }
      }
    },
    "static_pages": {
      "header": {
        "notif": "Oops! al parecer tu correo no pertenece a niguna red.",
        "search_network": "Busca tu red",
        "text1": "¿Ya eres usuario?",
        "text2": "Encuentra tu red",
        "text3": "Escribe tu correo electrónico para accesar a la red de tu institución.",
        "title1": "Metodologías",
        "title2": "Proyectos",
        "title3": "Nosotros",
        "title4": "Empleos",
        "title5": "Contacto"
      }
    },
    "survey_publication_tpl": {
      "respond_quest": "Cuestionario respondido"
    },
    "tour": {
      "survey_first_login": {
        "priv": "Aviso de Privacidad",
        "quest": "Enviar Encuesta",
        "text4": "Tus datos son confidenciales y serán utilizados con el fin de",
        "text5": "mejorar nuestro servicio, Revisa nuestro",
        "thnx": "Gracias.",
        "title": "Ayúdanos a mejorar",
        "title2": "Para Cúrsame es muy importante su participación, a continuación se le presentan algunas preguntas que nos permitirán mejorar continuamente y ofrecer una herramienta congruente con sus necesidades.",
        "title3": "Para Cúrsame es muy importante tu participación, a continuación se te presentan algunas preguntas que nos permitirán conocerte mejor. Tus respuestas son confidenciales y se usaran con el fin de mejorar continuamente."
      },
      "video_tour_first_time": {
        "loading_tour": "Cargando tour...",
        "wel_text": "Por favor mira con atención este tour inicial para que conozcas las principales secciones de la nueva plataforma.",
        "wel_text1": "En este pequeño video de introducción te mostramos las principales secciones de tu perfil y el de tus amigos.",
        "wel_text2": "En este video de introducción te mostramos las principales secciones y características del curso.",
        "welcome": "Bienvenido al nuevo Cúrsame"
      }
    },
    "user_header": {
      "activity_block": {
        "admin_href": "Administración",
        "edit_profile_href": "Editar perfil",
        "profile_href": "Ir a mi perfil",
        "sign_out_href": "Cerrar sesión"
      },
      "activity_notifications": {
        "help": "Ayuda"
      }
    },
    "user_joyride": {
      "content": "Creación de contenido",
      "content_area": "Esta es el area de creación de contenido.",
      "courses": "Cursos",
      "courses_area": "Esta es el area de tus cursos.",
      "edit_prof": "Editar perfil",
      "friends": "Amigos",
      "friends_list": "Aqui encontraras un listado de tus amigos",
      "notif": "Notificaciones",
      "prof": "Perfil",
      "prof_photo": "Aqui ver la foto de tu perfil.",
      "publ": "Publiciones",
      "publ_area": "Aqui encontraras todas las publicaciones de la red.",
      "text_edit_prof": "Aqui puedes editar tu perfil.",
      "text_notif": "Esta es el area de notificaciones.",
      "text_prof": "En este lugar podrás ver todo lo que pasa en tu red cursame.",
      "welcome_prof": "Bienvenido a tu perfil"
    },
    "wall_filters": {
      "all": "Todos",
      "comments": "Comentarios",
      "courses": "Cursos",
      "discuss": "Discusiones",
      "homework": "Tareas",
      "quest": "Cuestionarios"
    },
    "website": {
      "cta_request_demo": {
        "request_demo": "¡Solicita un demo en tu plantel!"
      },
      "other_contact_ways": {
        "follow_us_on_facebook": "Síguenos en Facebook",
        "follow_us_on_twitter": "Síguenos en Twitter",
        "text1": "Otras formas de contacto"
      }
    }
  },
  "superadmin": {
    "activities": {
      "activities": "Las actividades del sistema están geo localizadas",
      "activity": "Actividad por",
      "avg": "Promedio de calificación por tareas",
      "avg2": "Promedio de calificación por survey",
      "avg3": "Promedio de calificación por usuario",
      "avg4": "Promedio",
      "comments": "Comentarios",
      "courses": "Cursos",
      "exam": "Exámenes",
      "exam_delivery": "Entregas de examenes",
      "find": "Buscar Actividades por usuario o titulo",
      "goto": "Ir a la actividad",
      "hmwrks": "Tareas",
      "hmwrks_delivery": "Entregas de tareas",
      "lat": "Latitud",
      "long": "Longitud",
      "net": "Red",
      "no_act": "sin actividades",
      "os": "Sistema operativo",
      "place": "Lugar",
      "sys": "Actividades del sistema",
      "title": "Título",
      "type": "Tipo de Actividad",
      "ver": "Versión"
    },
    "courses_sintetic_view_and_edit": {
      "courses": "Visor de cursos",
      "hmwrks": "Tareas",
      "hmwrks_delivery": "Entregas de tarea",
      "quest": "Cuestionarios",
      "show": "Muestra los cursos de las redes, sus miembros y sus actividades",
      "show2": "Mostrar tareas",
      "show3": "Mostrar cuestionarios",
      "show4": "Mostrar estadísticas del curso",
      "show5": "Ver entregas",
      "stat": "Estadísticas"
    },
    "create_super_admin": {
      "enroll": "Registrar usuario",
      "img": "Puedes ver las instrucciones de creación de super admin accediendo al código qr",
      "superuser": "Super administrador Cúrsame"
    },
    "instructions": {
      "create": "Instrucciones para creación de súper administradores",
      "link": "Crea coloca tu nombre, apellido, email y contraseña, da click en continuar y listo"
    },
    "networks": {
      "admin": "Administrar networks",
      "create": "Crear Red",
      "create_net": "Creando networks",
      "edit": "Editar",
      "net": "Red",
      "subdomain": "Subdominio"
    },
    "statics": {
      "activities": "Actividades",
      "events": "Eventos",
      "exam": "Examenes",
      "exam_delivery": "Entrega de examenes",
      "hmwrks": "Tareas",
      "hmwrks_delivery": "Entrega de tareas",
      "statics1": "Estadísticas del sistema"
    },
    "users": {
      "activities": "Manejador de actividades",
      "discuss": "Discusiones",
      "edit1": "Editar usuario",
      "exam": "Examenes",
      "find_usr": "Buscar Usuario",
      "hmwrks": "Tareas",
      "response": "Respuestas de tareas",
      "response2": "Respuestas de examen",
      "show1": "Mostrar actividades",
      "statics": "Estadísticas",
      "usr": "Manejador de datos de usuario"
    }
  },
  "support": {
    "array": {
      "last_word_connector": " y ",
      "two_words_connector": " y ",
      "words_connector": ", "
    }
  },
  "surveys": {
    "ajax": {
      "surveys_paginate_ajax": {
        "no_more_quest": "No se encontraron más cuestionarios pasados."
      }
    },
    "answer_fields": {
      "correct": "Correcta",
      "delete": "Eliminar",
      "response": "Ingresar respuesta"
    },
    "correct_create": "Cuestionario creado correctamente.",
    "correct_edit": "Cuestionario editado correctamente.",
    "form": {
      "add_quest": "Agregar Pregunta",
      "attempts": "Intentos",
      "cancel": "Cancelar",
      "courses": "Cursos",
      "create": "Crear Cuestionario",
      "dates": "Fechas",
      "deliver_date": "Fecha de entrega",
      "example": "Ejemplo",
      "non_mins": "Sin límite de tiempo",
      "publish_date": "Día de pubicación",
      "quest": "Preguntas",
      "save": "Guardar Cuestionario",
      "support": "Material de soporte",
      "text1": "Números primos",
      "timer": "Tiempo para resolución del cuestionario",
      "title": "Titulo del cuestionario"
    },
    "index": {
      "more_days": "Cuestionarios para responder en 3 días o más",
      "no_quest": "No tienes cuestionarios pendientes por contestar.",
      "section": "sección de cuestionarios Pasados",
      "see": "Puedes ver antiguos cuestionarios en la",
      "today": "Cuestionarios para responder Hoy",
      "tomorrow": "Cuestionarios para responder Mañana"
    },
    "lapsed": {
      "no_quest": "No se encontraron más cuestionarios pasados."
    },
    "my_surveys": {
      "no_quest": "No tienes cuestionarios por contestar."
    },
    "question_fields": {
      "add_answer": "Agregar Respuesta",
      "quest1": "Ingresar pregunta"
    },
    "select_course": "Selecciona un curso para publicar tu cuestionario.",
    "shared": {
      "survey_card": {
        "edit": "Editar Cuestionario",
        "no_limit_time": "Sin límite de tiempo",
        "notice_helper": "Este cuestionario te dará",
        "notice_helper2": "minutos para responderlo",
        "quest": "Ver Cuestionario",
        "solve_time": "Minutos"
      },
      "survey_modal": {
        "calif": "Calificación Obtenida",
        "fail_attemps": "No tienes más intentos",
        "feedback": "Retroalimentación",
        "quest": "Cuestionario en el curso",
        "response": "Responder antes del"
      },
      "survey_questions_modal": {
        "quest": "Enviar cuestionario"
      },
      "surveys_course_header": {
        "past": "Pasados",
        "quest": "Cuestionarios",
        "response": "Responder"
      },
      "surveys_courses_filter": {
        "filter": "Filtrar",
        "select": "Selecciona un curso"
      },
      "surveys_header": {
        "past": "Pasados",
        "quest": "Cuestionarios",
        "response": "Responder"
      },
      "surveys_paginate_button": {
        "load": "Cargar más..."
      }
    },
    "survey_response_tpl": {
      "answer": "Contestar",
      "cancel": "Cancelar"
    },
    "surveys_course": {
      "more_days": "Cuestionarios para responder en 3 días o más",
      "no_quest": "No tienes cuestionarios pendientes por contestar en este curso.",
      "past": "sección de cuestionarios Pasados",
      "see": "Puedes ver antiguos cuestionarios en la",
      "to_day": "Cuestionarios para responder Hoy",
      "tomorrow": "Cuestionarios para responder Mañana"
    },
    "surveys_course_lapsed": {
      "quest": "No se encontraron más cuestionarios pasados."
    }
  },
  "surveys_controller": {
    "no_accept": "Estas tratando de ver Cuestionarios de un curso donde no has sido aceptado.",
    "no_exist": "El cuestionario que intentas ver no existe o ha sido borrado.",
    "no_quest_accept": "Estas tratando de ver Cuestionarios de un curso donde no has sido aceptado.",
    "no_quest_register": "Estas tratando de ver Cuestionarios de un curso donde no estas inscrito.",
    "no_register": "Estas tratando de ver Cuestionarios de un curso donde no estas inscrito."
  },
  "time": {
    "am": "am",
    "formats": {
      "default": "%a, %d de %b de %Y a las %H:%M:%S %Z",
      "long": "%A, %d de %B de %Y a las %I:%M %p",
      "short": "%d de %b a las %H:%M hrs"
    },
    "pm": "pm"
  },
  "users": {
    "califications": {
      "deliveries_table": {
        "avg": "Calificación promedio en tareas",
        "hmwrk": "Tareas",
        "hmwrks": "Tarea",
        "no_deliver": "No entregada",
        "no_hmwrks": "Aún no hay tareas en este curso.",
        "no_score": "No calificada",
        "percent": "Porcentaje: %{number}%",
        "score": "Calificación"
      },
      "discussions_table": {
        "avg_score": "Calificación promedio en discusiones",
        "discuss": "Discusiones",
        "discuss2": "Discusión",
        "no_discuss": "Aún no hay discusiones evaluables en este curso.",
        "no_part": "Sin participación",
        "no_score": "No calificada",
        "percent": "Porcentaje: %{number}%",
        "score": "Calificación"
      },
      "enroll": "Necesitas estar inscrito en al menos un curso para tener calificaciones.",
      "no_score": "Aún no tienes calificaciones.",
      "ratings": "Calificaciones",
      "surveys_table": {
        "avg": "Porcentaje: %{number}%",
        "exam": "Examen",
        "no_answered": "No resuelto",
        "quest": "Cuestionarios",
        "quest2": "Calificación promedio en cuestionarios",
        "quest3": "Aún no hay cuestionarios en este curso.",
        "score": "Calificación"
      }
    },
    "courses": {
      "courses2": "Cursos",
      "find": "Busca cursos en la sección de",
      "no_members": "Este usuario no esta inscrito en ningún curso.",
      "no_registered": "Aún no estas inscrito en ningún curso."
    },
    "dashboard": {
      "goto": "Ir al super administrador",
      "log_out": "Salir de mi sesión",
      "select": "Seleccionador de redes",
      "text1": "Cuando usted seleccione la network debera iniciar sesión en la red a la que se le dirija ya que es una celula independiente del sistema"
    },
    "evaluation": {
      "no_members": "Este curso no tiene miembros",
      "score": "Calificacion"
    },
    "form_course": {
      "cancel": "Cancel",
      "create": "Crear nuevo",
      "create2": "Crear",
      "descrip": "Descripción",
      "init_date": "Fecha inicio",
      "load": "Cargando ...",
      "name": "Nombre",
      "private": "Privado",
      "public": "Público"
    },
    "friends": {
      "comunity": "Comunidad",
      "find": "Busca a tus amigos en la sección de",
      "friends_subtitle": {
        "all_friends": "Todos mis amigos",
        "friends1": "Amigos",
        "request": "Solicitudes pendientes"
      },
      "no_friends": "Aún no tienes amigos.",
      "no_friends2": "Este usuario no tiene amigos aún."
    },
    "friends_first_user": {
      "friend_req": "Solicitud de amistad",
      "friends": "Amigos",
      "pendent": "Solicitudes pendientes",
      "send": "Solicitud de amistad enviada"
    },
    "index": {
      "all": "Todos los usuarios"
    },
    "info": {
      "bio": "Biografia",
      "email": "Correo Electronico",
      "info2": "Información",
      "no_bio": "Este usuario no cuenta con biografia."
    },
    "menu_member": {
      "enroll": "inscribirse a una red",
      "friends": "mis amigos",
      "net": "mis redes"
    },
    "pendding_friends": {
      "no_request": "No hay solicitudes de amistad pendientes."
    },
    "set_password_form": {
      "pwd": "Ingresa una contraseña.",
      "save": "Guardar contraseña",
      "set_pwd": "Establece tu contraseña",
      "welcome": "Bienvenido a Cúrsame, es necesario que establezcas una contraseña para terminar con el proceso de registro."
    },
    "shared": {
      "user_card": {
        "add_friends": "Agregar a mis amigos",
        "admin": "Administrador",
        "cancel": "Cancelar solicitud de amistad",
        "confirm": "Confirmar solicitud de amistad",
        "delete": "Eliminar de mis amigos",
        "delete2": "Eliminar solicitud de amistad",
        "friends": "Amigos",
        "respond": "Responder solicitud de amistad",
        "send_request": "Solicitud enviada",
        "student": "Estudiante",
        "teacher": "Profesor"
      },
      "user_profile_header": {
        "accept": "Aceptar solicitud de amistad",
        "add_friends": "Añadir a mis amigos",
        "cancel": "Cancelar solictud de amistad",
        "courses": "Cursos",
        "edit": "Editar Perfil",
        "friends": "Amigos",
        "ignore": "Ignorar",
        "info": "Información",
        "publications": "Publicaciones",
        "send": "Solicitud enviada",
        "update": "Actualizar portada",
        "update_photo": "Actualizar foto"
      }
    },
    "show": {
      "add": "Agrégalo para poder postear en su muro.",
      "no_friend": "No eres amigo del usuario"
    },
    "sufriend": {
      "accept": "Aceptar como amigo",
      "name": "Nombre"
    },
    "waiting_friends": {
      "friends": "Amigos en espera",
      "request": "Este usuario te ha solicitado amistad",
      "waiting_friends": "Esperando aceptación de"
    }
  },
  "users_controller": {
    "canot_delete": "No puedes borrar este usuario.",
    "correct_delete": "Usuario fue borrado correctamente",
    "deleted_usr": "El Usuario ya fue borrado",
    "no_exist": "El usuario que intentas ver no existe o ha sido borrado.",
    "no_register": "no estas inscrito en ninguna red",
    "save_pwd": "Se ha guardado tu contraseña correctamente."
  },
  "users_mailer": {
    "notice_to_user": {
      "activity": "tiene 5 nuevas actividades en la plataforma.",
      "activitys": "Tiene 5 nuevas actividades en la plataforma.",
      "goto": "Ir a actividades",
      "hello": "Hola",
      "notif": "Tiene 5 notificaciones activas",
      "welcome": "Bienvenido"
    },
    "teachers_day": {
      "click": "haz click aquí.",
      "happy": "¡Feliz día del Maestro!",
      "hello": "Hola",
      "mail": "Si no puedes ver este mail",
      "teacher": "Profesor(a)",
      "text1": "En Cúrsame estamos muy orgullosos de tí y de la labor tan importante que realizas por la educación en México, es una responsabilidad muy grande guiar a los futuros líderes y ciudadanos de nuestro País.",
      "text2": "Personalmente quiero felicitarte y reiterar el compromiso que tenemos contigo. El trabajo que realizamos está pensado en generarte valor, mejorar tu capacidad de enseñanza y ayudar a que tu labor como docente sea más satisfactoria, productiva y enriquecedora. Seguiremos mejorando nuestra plataforma con este fin porque eres la pieza clave para que Cúrsame cumpla su misión.",
      "text3": "Por tu dedicación permanente, por los esfuerzos que realizas, por no desistir en los tiempos difíciles y conservar la esperanza de educar para un mundo mejor: En nombre de todo nuestro equipo de trabajo te deseo un feliz día del Maestro ¡Te lo mereces!"
    }
  },
  "usessions": {
    "new": {
      "confirm": "Esperando confirmación",
      "email": "Correo electrónico",
      "init_session": "Iniciar sesión",
      "pwd": "Contraseña",
      "remember": "Recordarme",
      "send": "Se ha enviado un correo a"
    }
  },
  "usessions_controller": {
    "hello": "Hola ",
    "invalid": "No se ha creado correctamente la sesión ya que la contraseña o el email son inválidos.",
    "welcome": " bienvenido de nuevo."
  },
  "views": {
    "pagination": {
      "first": "Inicio",
      "last": "Último",
      "next": "Siguiente",
      "previous": "Anterior",
      "truncate": "..."
    }
  },
  "will_paginate": {
    "next_label": "Siguiente &#8594;",
    "page_gap": "&hellip;",
    "previous_label": "&#8592; Anterior"
  }
};
