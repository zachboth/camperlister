shared_examples "request authorized for" do |user|
  context "for #{user}" do
    before do
      model = instance_variable_get("@#{user}")
      login_as model
      get @path
    end

    it "allows access" do
      expect(response).to be_success
    end
  end
end

shared_examples "request unauthorized for" do |user|
  context "for #{user}" do
    before do
      model = instance_variable_get("@#{user}")
      login_as model
      get @path
    end

    it { is_expected.to redirect_to summary_path }
  end
end

shared_examples "request denied for" do |user|
  context "for #{user}" do
    before do
      model = instance_variable_get("@#{user}")
      login_as model
      get @path
    end

    it { is_expected.to redirect_to new_user_session_path }
  end
end

shared_examples "request denied for guest" do
  context "for guest" do
    before do
      get @path
    end

    it { is_expected.to redirect_to new_user_session_path }
  end
end

# Expects pre-defined variables:
#   @admin - an admin user
#   @user  - user who has access to the resource, if applicable
#   @path  - the path to test
shared_examples "request authorized for admin only" do
  include_examples "request authorized for", :admin
  include_examples "request unauthorized for", :user
  include_examples "request denied for guest"
end

# Expects pre-defined variables:
#   @admin  - an admin user
#   @user  - user who has access to the resource, if applicable
#   @path   - the path to test
shared_examples "request authorized for signed-in users" do
  include_examples "request authorized for", :admin
  include_examples "request authorized for", :user
  include_examples "request denied for guest"
end
