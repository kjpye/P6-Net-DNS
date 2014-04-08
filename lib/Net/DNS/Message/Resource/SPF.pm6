role Net::DNS::Message::Resource::SPF;

class Net::DNS::SPF {
    has $.text;

    method Str {
        return $.text;
    }
}

method rdata-parsed {
    my $text = Buf.new($.rdata[1..*]).decode('ascii');
    return Net::DNS::SPF.new(:$text);
}
