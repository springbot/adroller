require 'spec_helper'

describe DemoResponses do
  describe ' make_demo_response' do
    class DummyClass
    end

    before(:each) do
      @dummy_class = DummyClass.new
      @dummy_class.extend(DemoResponses)
    end

    context 'when endpoint is /activate/api/v2/adgroup' do
      let(:request_uri) do
        'https://services.adroll.com/activate/api/v2/adgroup'
      end

      context 'when method is get' do
        it 'returns the default response' do
          response = @dummy_class.make_demo_response(:get, request_uri, {}, {})

          expect(response.code).to eq(200)
          expect(response.body).to eq("{\"message\":\"\",\"status\":200,\"data\":\"\"}")
          expect(response.parsed_response['data']).to eq([])
          expect(response.parsed_response['results']).to eq([])
        end
      end

      context 'when method is put' do
        it 'returns the expected response' do
          response = @dummy_class.make_demo_response(:put, request_uri, {'end_date' => 'end-date-1', 'name' => 'name-1', 'start_date' => 'start-date-1', 'status' => 'status-1'}, {eid: 'abcdefg'})

          expect(response.code).to eq(200)
          expect(response.body).to eq('{"message":"","status":200,"data":{"ad_type":"string","ads":[],"campaign_eid":"abcdefg","eid":"abc","end_date":"end-date-1","name":"name-1","objective":"convert","start_date":"start-date-1","status":"status-1"}}')

          expected_data = [{"ad_type"=>"string", "ads"=>[], "campaign_eid"=>"abcdefg", :eid=>"abc", :end_date=>"end-date-1", :name=>"name-1", :objective=>"convert", :start_date=>"start-date-1", :status=>"status-1"}]
          expect(response.parsed_response['data']).to eq(expected_data)
          expect(response.parsed_response['results']).to eq(expected_data)
        end
      end
    end

    context 'when endpoint is /api/v1/advertisable/get' do
      let(:request_uri) do
        'https://services.adroll.com/api/v1/advertisable/get'
      end

      context 'when method is get' do
        it 'returns the expected response' do
          response = @dummy_class.make_demo_response(:get, request_uri, {}, {})

          expect(response.code).to eq(200)
          expect(response.body).to eq('{"message":"","status":200,"results":{"approval_state":"","attached_users":[],"blacklisted_sites":[],"business_unit":"","click_through_conversion_window":0,"cm_networks":"","company_phone":"","created_date":"","eid":"","enable_customer_multi_dur_segs":true,"has_approved_consent_solution":true,"has_privacy_policy":true,"iab1_category_id":0,"iab1_category_name":0,"iab2_category_id":0,"iab2_category_name":0,"iab_content_id":0,"is_active":true,"is_coop_approved":true,"is_publisher":true,"liquidads":"","name":"","ops":"","optimizer":"","organization":"","product_name":"","saleser":"","status":"","updated_date":"","url":"","view_through_conversion_window":0,"zvelo_category_id":0,"zvelo_category_name":""}}')

          expected_data = [{"approval_state"=>"", "attached_users"=>[], "blacklisted_sites"=>[], "business_unit"=>"", "click_through_conversion_window"=>0, "cm_networks"=>"", "company_phone"=>"", "created_date"=>"", "eid"=>"", "enable_customer_multi_dur_segs"=>true, "has_approved_consent_solution"=>true, "has_privacy_policy"=>true, "iab1_category_id"=>0, "iab1_category_name"=>0, "iab2_category_id"=>0, "iab2_category_name"=>0, "iab_content_id"=>0, "is_active"=>true, "is_coop_approved"=>true, "is_publisher"=>true, "liquidads"=>"", "name"=>"", "ops"=>"", "optimizer"=>"", "organization"=>"", "product_name"=>"", "saleser"=>"", "status"=>"", "updated_date"=>"", "url"=>"", "view_through_conversion_window"=>0, "zvelo_category_id"=>0, "zvelo_category_name"=>""}]
          expect(response.parsed_response['data']).to eq(expected_data)
          expect(response.parsed_response['results']).to eq(expected_data)
        end
      end

      context 'when method is put' do
        it 'returns the default response' do
          response = @dummy_class.make_demo_response(:put, request_uri, {}, {})

          expect(response.code).to eq(200)
          expect(response.body).to eq("{\"message\":\"\",\"status\":200,\"data\":\"\"}")
          expect(response.parsed_response['data']).to eq([])
          expect(response.parsed_response['results']).to eq([])
        end
      end
    end

    context 'when endpoint is /api/v1/facebook/fb_page_url' do
      let(:request_uri) do
        'https://services.adroll.com/api/v1/facebook/fb_page_url'
      end

      context 'when method is get' do
        it 'returns the expected response' do
          response = @dummy_class.make_demo_response(:get, request_uri, {}, {})

          expect(response.code).to eq(200)
          expect(response.body).to eq('{"message":"","status":200,"data":{"fb_page_id":"123456789","fb_page_img":"","fb_page_name":"Fake Page","fb_page_url":"https://www.facebook.com/FakePage-123456789","is_published":false,"no_profile_picture":false,"page_access":true,"page_admin_access":true}}')

          expected_data = [{"fb_page_id"=>"123456789", "fb_page_img"=>"", "fb_page_name"=>"Fake Page", "fb_page_url"=>"https://www.facebook.com/FakePage-123456789", "is_published"=>false, "no_profile_picture"=>false, "page_access"=>true, "page_admin_access"=>true}]
          expect(response.parsed_response['data']).to eq(expected_data)
          expect(response.parsed_response['results']).to eq(expected_data)
        end
      end

      context 'when method is put' do
        it 'returns the default response' do
          response = @dummy_class.make_demo_response(:put, request_uri, {}, {})

          expect(response.code).to eq(200)
          expect(response.body).to eq("{\"message\":\"\",\"status\":200,\"data\":\"\"}")
          expect(response.parsed_response['data']).to eq([])
          expect(response.parsed_response['results']).to eq([])
        end
      end
    end

    context 'when endpoint is /api/v1/dynamic_template_capability_description/get_all' do
      let(:request_uri) do
        'https://services.adroll.com/api/v1/dynamic_template_capability_description/get_all'
      end

      context 'when method is get' do
        it 'returns the expected response' do
          response = @dummy_class.make_demo_response(:get, request_uri, {}, {})

          expect(response.code).to eq(200)
          expect(response.body).to eq('{"message":"","status":200,"results":[{"is_enabled":true,"description":"Promo text","eid":"CHU4RLZSVJCVNG6ZELX2RM","type":null,"id":1,"name":"promoText"},{"is_enabled":true,"description":"Sale price","eid":"RJTMLC5L4ZDVFJSGV3EMOJ","type":null,"id":2,"name":"salePrice"},{"is_enabled":true,"description":"Yotpo Reviews","eid":"JEX3S2DGJVFITGQT4DP4CT","type":null,"id":5,"name":"yotpoReviews"},{"is_enabled":true,"description":"Countdown End","eid":"6FIHPHA5ABCI7EKUBAAFHP","type":null,"id":38,"name":"countdownEnd"}]}')

          expected_data = [{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}, {:is_enabled=>true, :description=>"Yotpo Reviews", :eid=>"JEX3S2DGJVFITGQT4DP4CT", :type=>nil, :id=>5, :name=>"yotpoReviews"}, {:is_enabled=>true, :description=>"Countdown End", :eid=>"6FIHPHA5ABCI7EKUBAAFHP", :type=>nil, :id=>38, :name=>"countdownEnd"}]
          expect(response.parsed_response['data']).to eq(expected_data)
          expect(response.parsed_response['results']).to eq(expected_data)
        end
      end

      context 'when method is put' do
        it 'returns the default response' do
          response = @dummy_class.make_demo_response(:put, request_uri, {}, {})

          expect(response.code).to eq(200)
          expect(response.body).to eq("{\"message\":\"\",\"status\":200,\"data\":\"\"}")
          expect(response.parsed_response['data']).to eq([])
          expect(response.parsed_response['results']).to eq([])
        end
      end
    end

    context 'when endpoint is /api/v1/dynamic_template/get_all_for_advertisable' do
      let(:request_uri) do
        'https://services.adroll.com/api/v1/dynamic_template/get_all_for_advertisable'
      end

      context 'when method is get' do
        it 'returns the expected response' do
          response = @dummy_class.make_demo_response(:get, request_uri, {}, {})

          expect(response.code).to eq(200)
          expect(response.body).to eq("{\"message\":\"\",\"status\":200,\"results\":[{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"Product Gladiator\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":1,\"eid\":\"GYV4ZCRXCZBQZLRTSEMANK\",\"id\":64,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[{\"url\":null,\"description\":null,\"id\":491077,\"name\":\"Albert's Apparel\",\"eid\":\"DHLZVDM7XZHZDLKSJC5OLD\"}],\"name\":\"Maximus\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":2,\"eid\":\"YIETL4UC7RDBTIPNDO3BKR\",\"id\":108,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"Enhancer\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":3,\"eid\":\"IIZ2EXCWXFHBTIT7ZBHWU3\",\"id\":235,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[{\"url\":null,\"description\":null,\"id\":491077,\"name\":\"Albert's Apparel\",\"eid\":\"DHLZVDM7XZHZDLKSJC5OLD\"}],\"name\":\"Slot Machine\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":7,\"eid\":\"DLSTZABMXZBMXHKVSNAUH5\",\"id\":197,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"Classic carousel\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":8,\"eid\":\"UEM7NKGSWNBCNLAAMPFRHK\",\"id\":1,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"Duotone carousel\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":9,\"eid\":\"VF63IQXOENDI5GGA6B5XRS\",\"id\":2,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[{\"url\":null,\"description\":null,\"id\":491077,\"name\":\"Albert's Apparel\",\"eid\":\"DHLZVDM7XZHZDLKSJC5OLD\"}],\"name\":\"Promo Flip\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":11,\"eid\":\"IKGDEIR62ZBYRDWH2EGC6U\",\"id\":214,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[{\"url\":null,\"description\":null,\"id\":491077,\"name\":\"Albert's Apparel\",\"eid\":\"DHLZVDM7XZHZDLKSJC5OLD\"}],\"name\":\"Product Limelight\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":12,\"eid\":\"A6YHMZAQ7NAQNJUHYSDNBC\",\"id\":119,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"Promo Messaging\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":14,\"eid\":\"F4AAKPQNBNCNHNH66LLXCE\",\"id\":39,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"Classic spotlight\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":15,\"eid\":\"W4HHTPMDTNDPLMZZBF6Z7C\",\"id\":0,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"Countdown Timer\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"},{\"is_enabled\":true,\"description\":\"Countdown End\",\"eid\":\"6FIHPHA5ABCI7EKUBAAFHP\",\"type\":null,\"id\":38,\"name\":\"countdownEnd\"}],\"order\":19,\"eid\":\"R3CYR24CYZBT3KMBAZCNFC\",\"id\":148,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"*NEW* - Cyber Monday Border\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":20,\"eid\":\"65FI34Y5ENBJVLDYNNPOLM\",\"id\":282,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"*NEW* - Black Friday Border\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":21,\"eid\":\"JF57EK3JVJGVLCN3KSLMFC\",\"id\":280,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[{\"url\":null,\"description\":null,\"id\":491077,\"name\":\"Albert's Apparel\",\"eid\":\"DHLZVDM7XZHZDLKSJC5OLD\"}],\"name\":\"Holiday Bow 2.0\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":22,\"eid\":\"UX2CZHS7DNAYLPE3LWGMS3\",\"id\":201,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[{\"url\":null,\"description\":null,\"id\":491077,\"name\":\"Albert's Apparel\",\"eid\":\"DHLZVDM7XZHZDLKSJC5OLD\"}],\"name\":\"Christmas Tree\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":23,\"eid\":\"ON65GKYB5ZH5BMEV2HRRVV\",\"id\":199,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"Holiday Sparkle\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Saleprice\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":24,\"eid\":\"S7SC62U2JVH53HLSTSALVW\",\"id\":36,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"*NEW* - Deluxe Timer\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Promo text\",\"eid\":\"CHU4RLZSVJCVNG6ZELX2RM\",\"type\":null,\"id\":1,\"name\":\"promoText\"},{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"},{\"is_enabled\":true,\"description\":\"Countdown End\",\"eid\":\"6FIHPHA5ABCI7EKUBAAFHP\",\"type\":null,\"id\":38,\"name\":\"countdownEnd\"}],\"order\":25,\"eid\":\"FRHHAYZ5CNBNTMWMTNXA4R\",\"id\":284,\"is_private\":false,\"is_published\":true},{\"category\":null,\"is_visible\":true,\"allowed_advertisables\":[],\"name\":\"*NEW* - Retro Snow\",\"in_testing\":false,\"capabilities\":[{\"is_enabled\":true,\"description\":\"Sale price\",\"eid\":\"RJTMLC5L4ZDVFJSGV3EMOJ\",\"type\":null,\"id\":2,\"name\":\"salePrice\"}],\"order\":29,\"eid\":\"KKMSKTI6AVFCTDOJFTFA62\",\"id\":293,\"is_private\":false,\"is_published\":true}]}")

          expected_data = [{:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"Product Gladiator", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>1, :eid=>"GYV4ZCRXCZBQZLRTSEMANK", :id=>64, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[{:url=>nil, :description=>nil, :id=>491077, :name=>"Albert's Apparel", :eid=>"DHLZVDM7XZHZDLKSJC5OLD"}], :name=>"Maximus", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>2, :eid=>"YIETL4UC7RDBTIPNDO3BKR", :id=>108, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"Enhancer", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>3, :eid=>"IIZ2EXCWXFHBTIT7ZBHWU3", :id=>235, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[{:url=>nil, :description=>nil, :id=>491077, :name=>"Albert's Apparel", :eid=>"DHLZVDM7XZHZDLKSJC5OLD"}], :name=>"Slot Machine", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>7, :eid=>"DLSTZABMXZBMXHKVSNAUH5", :id=>197, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"Classic carousel", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>8, :eid=>"UEM7NKGSWNBCNLAAMPFRHK", :id=>1, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"Duotone carousel", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2,:name=>"salePrice"}], :order=>9, :eid=>"VF63IQXOENDI5GGA6B5XRS", :id=>2, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[{:url=>nil, :description=>nil, :id=>491077, :name=>"Albert's Apparel", :eid=>"DHLZVDM7XZHZDLKSJC5OLD"}], :name=>"Promo Flip", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>11, :eid=>"IKGDEIR62ZBYRDWH2EGC6U", :id=>214, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[{:url=>nil, :description=>nil, :id=>491077, :name=>"Albert's Apparel", :eid=>"DHLZVDM7XZHZDLKSJC5OLD"}], :name=>"Product Limelight", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>12, :eid=>"A6YHMZAQ7NAQNJUHYSDNBC", :id=>119, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"Promo Messaging", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>14, :eid=>"F4AAKPQNBNCNHNH66LLXCE", :id=>39, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"Classic spotlight", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>15, :eid=>"W4HHTPMDTNDPLMZZBF6Z7C", :id=>0, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"Countdown Timer", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}, {:is_enabled=>true, :description=>"Countdown End", :eid=>"6FIHPHA5ABCI7EKUBAAFHP", :type=>nil, :id=>38, :name=>"countdownEnd"}], :order=>19, :eid=>"R3CYR24CYZBT3KMBAZCNFC", :id=>148, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"*NEW* - Cyber Monday Border", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>20, :eid=>"65FI34Y5ENBJVLDYNNPOLM", :id=>282, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"*NEW* - Black Friday Border", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>21, :eid=>"JF57EK3JVJGVLCN3KSLMFC", :id=>280, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[{:url=>nil, :description=>nil, :id=>491077, :name=>"Albert's Apparel", :eid=>"DHLZVDM7XZHZDLKSJC5OLD"}], :name=>"Holiday Bow 2.0", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>22, :eid=>"UX2CZHS7DNAYLPE3LWGMS3", :id=>201, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[{:url=>nil, :description=>nil, :id=>491077, :name=>"Albert's Apparel", :eid=>"DHLZVDM7XZHZDLKSJC5OLD"}], :name=>"Christmas Tree", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>23, :eid=>"ON65GKYB5ZH5BMEV2HRRVV", :id=>199, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"Holiday Sparkle", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Saleprice", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>24, :eid=>"S7SC62U2JVH53HLSTSALVW", :id=>36, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"*NEW* - Deluxe Timer", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Promo text", :eid=>"CHU4RLZSVJCVNG6ZELX2RM", :type=>nil, :id=>1, :name=>"promoText"}, {:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}, {:is_enabled=>true, :description=>"Countdown End", :eid=>"6FIHPHA5ABCI7EKUBAAFHP", :type=>nil, :id=>38, :name=>"countdownEnd"}], :order=>25, :eid=>"FRHHAYZ5CNBNTMWMTNXA4R", :id=>284, :is_private=>false, :is_published=>true}, {:category=>nil, :is_visible=>true, :allowed_advertisables=>[], :name=>"*NEW* - Retro Snow", :in_testing=>false, :capabilities=>[{:is_enabled=>true, :description=>"Sale price", :eid=>"RJTMLC5L4ZDVFJSGV3EMOJ", :type=>nil, :id=>2, :name=>"salePrice"}], :order=>29, :eid=>"KKMSKTI6AVFCTDOJFTFA62", :id=>293, :is_private=>false, :is_published=>true}]
          expect(response.parsed_response['data']).to eq(expected_data)
          expect(response.parsed_response['results']).to eq(expected_data)
        end
      end

      context 'when method is put' do
        it 'returns the default response' do
          response = @dummy_class.make_demo_response(:put, request_uri, {}, {})

          expect(response.code).to eq(200)
          expect(response.body).to eq("{\"message\":\"\",\"status\":200,\"data\":\"\"}")
          expect(response.parsed_response['data']).to eq([])
          expect(response.parsed_response['results']).to eq([])
        end
      end
    end

    context 'when endpoint is /unknown' do
      let(:request_uri) do
        'https://services.adroll.com/unknown'
      end

      it 'returns the default response' do
        response = @dummy_class.make_demo_response(:get, request_uri, {}, {})

        expect(response.code).to eq(200)
        expect(response.body).to eq("{\"message\":\"\",\"status\":200,\"data\":\"\"}")
        expect(response.parsed_response['data']).to eq([])
        expect(response.parsed_response['results']).to eq([])
      end
    end
  end
end
