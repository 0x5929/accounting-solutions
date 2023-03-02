require 'test_helper'
require 'minitest/mock'

class ApisTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'get all test' do
    get api_v1_documents_path
    assert_response :unauthorized

    sign_in_api users(:test1)

    get api_v1_documents_path
    assert_response :success
    assert_equal @response.body, documents(:one, :two).to_json
 
  end

  test 'get one test' do
    document = documents(:one)
    
    get api_v1_document_path(document)
    assert_response :unauthorized

    sign_in_api users(:test1)

    get api_v1_document_path(document)
    assert_response :success
    assert_equal @response.body, documents(:one).to_json
  end

  test 'post test' do
    post api_v1_documents_path, 
         params: { document: { file_location: 'testfilelocation2', file_name: 'testfilename2', 
                               user_id: users(:test1).id } }
    assert_response :unauthorized

    sign_in_api users(:test1)
    post api_v1_documents_path, as: :json,
                                params: { file_location: 'testfilelocation2', file_name: 'testfilename2', 
                                          user_id: users(:test1).id }
    assert_response :created 
  end

  test 'put test' do
    document = documents(:one)

    put api_v1_document_path(document), as: :json,
                                        params: { document: { file_location: 'testfilelocationupdate', file_name: 'testfilename2', 
                                                              user_id: users(:test1).id } }
    assert_response :unauthorized

    sign_in_api users(:test1)

    put api_v1_document_path(document), as: :json,
                                        params: { document: { file_location: 'testfilelocationupdate', file_name: 'testfilename2', 
                                                              user_id: users(:test1).id } }

    assert_response :success
  end

  test 'patch test' do
    document = documents(:one)

    patch api_v1_document_path(document), as: :json,
                                          params: { document: { file_name: 'testfilename2', 
                                                                user_id: users(:test1).id } }
    assert_response :unauthorized

    sign_in_api users(:test1)

    patch api_v1_document_path(document), as: :json,
                                          params: { document: { file_name: 'testfilename2', 
                                                                user_id: users(:test1).id } }

    assert_response :success
  end

  test 'delete test' do
    document = documents(:one)

    delete api_v1_document_path(document), as: :json
    assert_response :unauthorized

    sign_in_api users(:test1)
    delete api_v1_document_path(document), as: :json
    assert_response :no_content
  end
end
