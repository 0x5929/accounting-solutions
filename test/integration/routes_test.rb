require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'route test' do
    # assert site routes
    assert_generates '/', { controller: 'pages', action: 'index' }
    assert_generates '/about', { controller: 'pages', action: 'about' }
    assert_generates '/contact', { controller: 'pages', action: 'contact' }
    assert_generates '/services', { controller: 'pages', action: 'services' }

    # TODO: add admin and api routing tests
    # admin routes handled by ActiveAdmin
    # api routes handled by Doorkeeper
  end
end
