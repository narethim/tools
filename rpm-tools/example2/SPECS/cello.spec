Name:           cello
Version:        1.0
Release:        1%{?dist}
Summary:        Hello World example implemented in C

License:        GPLv3+
URL:            https://www.example.com/%{name}
Source0:        https://www.example.com/%{name}/releases/%{name}-%{version}.tar.gz

BuildRequires:  gcc
Requires:       make

%description
The long-tail description for our Hello World Example implemented in C.

%prep
%setup -q


%build
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
%make_install


%files
%license LICENSE
%{_bindir}/%{name}


%changelog
* Mon Feb 21 2022 Nareth Im <nareth.im@gmail.com> - 1.0-1
- First cello package

