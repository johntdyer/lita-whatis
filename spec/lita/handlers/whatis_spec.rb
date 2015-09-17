require 'spec_helper'

describe Lita::Handlers::Whatis, lita_handler: true do
  it do
    is_expected.to route_command('whatis is foo').to(:lookup)
    is_expected.to route_command('whatis foo').to(:lookup)
    is_expected.to route_command('define foo is bar').to(:define)
  end

  describe '#lookup' do
    it 'responds with the definition of the service' do
      send_command('define web is Rails. Rails. Rails.')
      send_command('whatis is web')
      expect(replies.last).to eq('web is Rails. Rails. Rails.')
    end

    it 'responds with the definition of a capitalized service' do
      send_command('define web is Rails. Rails. Rails.')
      send_command('whatis is WEB')
      expect(replies.last).to eq('WEB is Rails. Rails. Rails.')
    end

    it 'responds with an error if there is no such service' do
      send_command('whatis is foo')
      expect(replies.last).to eq('I don\'t know what foo is, ' \
                                 'type: define foo is <description> to set it.')
    end
  end
end
