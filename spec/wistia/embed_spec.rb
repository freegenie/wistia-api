require 'spec_helper'

module Wistia
  describe Embed do
    describe '#media_embed_code' do
      it 'should require a media ID' do
        expect {
          Wistia::Embed.media_embed_code({})
        }.to raise_error(RuntimeError)
      end

      it 'should assemble a query string' do
        Wistia::Embed
        Wistia::Base.stub_chain(:connection, :get, :body)# =>"<embed>")
        Wistia::Embed.media_embed_code(6, {:ssl => true})
      end

      it 'should request the specified embed code via a GET request' do
        url = "https://api.wistia.com/v1/medias/6/embed?"
        url += "embed_code_options[ssl]=1&embed_code_options[end_video_behavior]=reset"
        Wistia::Base.connection.should_receive(:get).with(url).
            and_return(mock("Response", :body => "<embed>"))

        Wistia::Embed.media_embed_code(6, {:ssl => true, :end_video_behavior => 'reset'})
      end
    end

    describe '#assemble_query' do
      it 'should recognize invalid keys' do
        expect {
          Wistia::Embed.assemble_query({:me => :you})
        }.to raise_error(UnsupportedKeyError)
      end

      it 'should assemble a correct query-string' do
        query = "embed_code_options[end_video_behavior]=string&embed_code_options[ssl]=1"
        Wistia::Embed.assemble_query({:end_video_behavior => "string", :ssl => true }).should == query
      end
    end
  end
end
