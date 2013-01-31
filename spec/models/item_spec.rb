# encoding: UTF-8

require 'spec_helper'

describe 'Объявления' do
  describe 'Установка тегов' do
    before(:all) do
      @tags = ['1', '2']
    end
    
    before(:each) do
      @i = FactoryGirl.create :item
    end
    
    it 'Умет устанавливать теги?' do
      @i.should respond_to(:set_tags)
    end
    
    it 'Проверим установку строки' do
      @i.set_tags @tags.join(', ')
      @i.tags.collect(&:name).sort.should == @tags
    end
    
    it 'Проверим некорректные данные' do
      expect { @i.set_tags(2) }.to raise_error(ArgumentError)
      expect { @i.set_tags('') }.to raise_error(ArgumentError)
      expect { @i.set_tags(['tst', '']) }.to raise_error(ArgumentError)
    end
  end
end
