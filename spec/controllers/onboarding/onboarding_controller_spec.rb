require 'rails_helper'

RSpec.describe OnboardingController, type: :controller do
  render_views

  before :each do
    @network = create(:network)
    @teacher = create(:user, role: 'teacher')
    @student = create(:user, role: 'student')
    sign_in @teacher
  end

  describe 'GET #user_profile' do
    before :each do
      get :user_profile
    end

    it 'has 302 status' do
      expect(response).to have_http_status(200)
    end

    it 'redirect_to the user_profile path' do
      expect(response).to render_template(:user_profile)
    end
  end

  describe 'PUT #update_user_profile' do
    before :each do
      @user = create(:user)
      @new_first_name = Faker::Name.first_name
      @new_last_name = Faker::Name.last_name
      @new_bios = Faker::Lorem.paragraph(2)
      @new_email = Faker::Internet.email

      put :update_user_profile, id: @user.id, user: {
        first_name: @new_first_name,
        last_name: @new_last_name,
        bios: @new_bios,
        email: @new_email
      }

      @updated_user = User.find @user.id
    end

    it 'should update user first_name' do
      expect(@updated_user.first_name).to eq(@new_first_name)
    end

    it 'should update user last_name' do
      expect(@updated_user.last_name).to eq(@new_last_name)
    end

    it 'should update user bios' do
      expect(@updated_user.bios).to eq(@new_bios)
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end
  end

  describe 'GET #new_course' do
    before :each do
      @course = create_course(@teacher, @network)
      get :new_course, id: @course.id
    end

    it 'has 200 status' do
      expect(response.status).to eq(200)
    end

    it 'renders the new_course template' do
      expect(response).to render_template('new_course')
    end

    it 'teacher should have authorization to new course' do
      with_user(@teacher) do
        should_be_allowed_to :new_course, :onboarding
      end
    end

    it "student shouldn't have authorization to new course" do
      with_user(@student) do
        should_not_be_allowed_to :new_course, :onboarding
      end
    end
  end

  describe 'POST #create_course' do
    before :each do
      @new_title = Faker::Name.title
      new_silabus = Faker::Lorem.paragraph(2)
      new_public_status = 'Private'
      new_init_date = DateTime.now

      post :create_course, course: {
        title: @new_title,
        silabus: new_silabus,
        public_status: new_public_status,
        init_date: new_init_date
      }

      @course = Course.find_by_title(@new_title)
    end

    it 'should create a new course' do
      expect(@course).not_to be_nil
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end

    it 'redirects to onboarding_select_users_path' do
      expect(response).to redirect_to(onboarding_select_users_path(@course.id))
    end

    it 'teacher should have authorization to create course' do
      with_user(@teacher) do
        should_be_allowed_to :create_course, :onboarding
      end
    end

    it "student shouldn't have authorization to create course" do
      with_user(@student) do
        should_not_be_allowed_to :create_course, :onboarding
      end
    end
  end

  describe 'GET #select_users' do
    before :each do
      @course = create_course(@teacher, @network)
      get :select_users, id: @course.id
    end

    it 'has 200 status' do
      expect(response.status).to eq(200)
    end

    it 'renders the select_users template' do
      expect(response).to render_template('select_users')
    end

    it 'teacher should have authorization to select users' do
      with_user(@teacher) do
        should_be_allowed_to :select_users, :onboarding
      end
    end

    it "student shouldn't have authorization to select users" do
      with_user(@student) do
        should_not_be_allowed_to :select_users, :onboarding
      end
    end
  end

  describe 'PUT #add_users' do
    before :each do
      @course = create_course(@teacher, @network)
      @student2 = create(:user, role: 'student')
      put :add_users, id: @course.id, students: {
        @student => 0,
        @student2 => 0
      }
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end

    it 'redirects to onboarding_evaluation_schema_path' do
      expect(response).to redirect_to(onboarding_evaluation_schema_path(@course.id))
    end

    it 'teacher should have authorization to add users to course' do
      with_user(@teacher) do
        should_be_allowed_to :add_users, :onboarding
      end
    end

    it "student shouldn't have authorization to add users to course" do
      with_user(@student) do
        should_not_be_allowed_to :add_users, :onboarding
      end
    end
  end

  describe 'GET #evaluation_schema' do
    before :each do
      @course = create_course(@teacher, @network)
      get :evaluation_schema, id: @course.id
    end

    it 'has 200 status' do
      expect(response.status).to eq(200)
    end

    it 'renders the evaluation_schema template' do
      expect(response).to render_template('evaluation_schema')
    end

    it 'teacher should have authorization to evaluation schema' do
      with_user(@teacher) do
        should_be_allowed_to :evaluation_schema, :onboarding
      end
    end

    it "student shouldn't have authorization to evaluation schema" do
      with_user(@student) do
        should_not_be_allowed_to :evaluation_schema, :onboarding
      end
    end
  end

  describe 'PUT #add_evaluation_schema' do
    before :each do
      @course = create_course(@teacher, @network)
      put :add_evaluation_schema, id: @course.id, course: {
        evaluation_criteria_attributes: [
          { evaluation_percentage: 60,
            evaluable_id: @course.id,
            evaluable_type: 'Course',
            _destroy: false
          },
          { evaluation_percentage: 20,
            evaluable_id: @course.id,
            evaluable_type: 'Course',
            _destroy: false
          },
          { evaluation_percentage: 20,
            evaluable_id: @course.id,
            evaluable_type: 'Course',
            _destroy: false
          }
        ]
      }
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end

    it 'teacher should have authorization to add evaluation schema' do
      with_user(@teacher) do
        should_be_allowed_to :add_evaluation_schema, :onboarding
      end
    end

    it "student shouldn't have authorization to add evaluation schema" do
      with_user(@student) do
        should_not_be_allowed_to :add_evaluation_schema, :onboarding
      end
    end
  end
end
