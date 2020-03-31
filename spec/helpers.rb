module Helpers

  EXPECTED_PACKAGED = "mysql-client-core-5.7_5.7.29-0ubuntu0.18.04.1_amd64.deb"

  RESPONSE_WITH_SUITABLE_CLIENTS =
  %{
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.11-0ubuntu6_amd64.deb">mysql-client-core-5.7_5.7.11-0ubuntu6_amd64.deb</a></td><td align="right">2016-04-14 05:15  </td><td align="right">1.6M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.11-0ubuntu6_i386.deb">mysql-client-core-5.7_5.7.11-0ubuntu6_i386.deb</a></td><td align="right">2016-04-14 05:55  </td><td align="right">1.7M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.21-1ubuntu1_amd64.deb">mysql-client-core-5.7_5.7.21-1ubuntu1_amd64.deb</a></td><td align="right">2018-02-05 17:08  </td><td align="right">2.2M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.21-1ubuntu1_i386.deb">mysql-client-core-5.7_5.7.21-1ubuntu1_i386.deb</a></td><td align="right">2018-02-05 16:59  </td><td align="right">2.2M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.25-1_amd64.deb">mysql-client-core-5.7_5.7.25-1_amd64.deb</a></td><td align="right">2019-01-29 05:38  </td><td align="right">2.2M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.25-1_i386.deb">mysql-client-core-5.7_5.7.25-1_i386.deb</a></td><td align="right">2019-01-29 05:53  </td><td align="right">2.3M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.28-0ubuntu0.19.04.2_amd64.deb">mysql-client-core-5.7_5.7.28-0ubuntu0.19.04.2_amd64.deb</a></td><td align="right">2019-11-18 12:34  </td><td align="right">1.8M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.28-0ubuntu0.19.04.2_i386.deb">mysql-client-core-5.7_5.7.28-0ubuntu0.19.04.2_i386.deb</a></td><td align="right">2019-11-18 12:34  </td><td align="right">1.9M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.29-0ubuntu0.16.04.1_amd64.deb">mysql-client-core-5.7_5.7.29-0ubuntu0.16.04.1_amd64.deb</a></td><td align="right">2020-01-27 15:03  </td><td align="right">1.4M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.29-0ubuntu0.16.04.1_i386.deb">mysql-client-core-5.7_5.7.29-0ubuntu0.16.04.1_i386.deb</a></td><td align="right">2020-01-27 15:03  </td><td align="right">1.4M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.29-0ubuntu0.18.04.1_amd64.deb">mysql-client-core-5.7_5.7.29-0ubuntu0.18.04.1_amd64.deb</a></td><td align="right">2020-01-27 15:04  </td><td align="right">1.9M</td></tr>
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.7_5.7.29-0ubuntu0.18.04.1_i386.deb">mysql-client-core-5.7_5.7.29-0ubuntu0.18.04.1_i386.deb</a></td><td align="right">2020-01-27 15:04  </td><td align="right">1.9M</td></tr>
  }

RESPONSE_WITHOUT_SUITABLE_CLIENTS =
  %{
  <tr><td valign="top"><img src="/icons/unknown.gif" alt="[   ]"></td><td><a href="mysql-client-core-5.5_5.5.47-0+deb7u1_ia64.deb">mysql-client-core-5.5_5.5.47-0+deb7u1_ia64.deb</a></td><td align="right">2016-01-27 20:58  </td><td align="right">2.0M</td></tr>
  }

  def stub_request_to_ubuntu_base_url(response)
    stub_request(:get, BuildPack::Downloader::MYSQL_BASE_URL).
      with(:headers => {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Host'=>'security.ubuntu.com',
        'User-Agent'=>'Ruby'}).
      to_return(
        :status => 200,
        :body => response,
        :headers => {})
  end

  def stub_request_for_expected_package
    stub_request(:get, "#{BuildPack::Downloader::MYSQL_BASE_URL}#{EXPECTED_PACKAGED}").
      with(:headers => {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Host'=>'security.ubuntu.com',
        'User-Agent'=>'Ruby'}).
      to_return(
        :status => 200,
        :body => "fake binary data",
        :headers => {})
        expect(described_class).to receive(:`).with(EXPECTED_DEB_COMMAND) { `#{STUBBED_DEB_COMMAND}` }
  end
end
