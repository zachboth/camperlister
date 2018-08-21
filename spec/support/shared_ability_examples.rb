shared_examples_for "has restful abilities" do |actions|
  it "has restful abilities #{actions}" do
    expect(ability).to be_able_to [actions].flatten, @object
    expect(ability).not_to be_able_to (RESTFUL_ACTIONS - [actions].flatten), @object
  end
end

shared_examples_for "has no abilities" do
  it "has no abilities" do
    expect(ability).not_to be_able_to RESTFUL_ACTIONS, @object
  end
end
