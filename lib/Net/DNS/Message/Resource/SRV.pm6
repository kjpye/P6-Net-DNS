role Net::DNS::Message::Resource::SRV;

class Net::DNS::SRV {
    has $.priority;
    has $.weight;
    has $.port;
    has @.name;

    method Str {
        return @.name.join('.') ~ ':' ~ $.port;
    }
}

method rdata-parsed {
    my ($priority, $weight, $port) = $.rdata.unpack('nnn');
    my $name = self.parse-domain-name(Buf.new($.rdata[6..*]),
                                      %.name-offsets,
                                      $.start-offset + $.parsed-bytes);
    return Net::DNS::SRV.new(:$priority, :$weight, :$port, :name($name<name>.list));
}
