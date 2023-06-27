require 'rails_helper'

RSpec.describe Category, type: :model do

  it 'has fields name and description' do
    category = Category.new(name: 'Example', description: 'Example description')
    expect(category.name).to eq('Example')
    expect(category.description).to eq('Example description')
  end

  it 'error if name or description are blank' do
    category = Category.new(name: '', description: '')
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
    expect(category.errors[:description]).to include("can't be blank")
  end

  it 'validates uniqueness of name' do
    existing_category = Category.create(name: 'Example', description: 'Example description')
    category = Category.new(name: 'Example', description: 'Example description')
    category.valid?
    expect(category.errors[:name]).to include('has already been taken')
  end

end
