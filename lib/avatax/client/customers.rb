module AvaTax
  class Client
    module Customers 


      # Create customers for this company
      #
      # Create one or more customers for this company.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # A nested object such as CustomFields could be specified and created along with the customer object. To fetch the
      # nested object, please call 'GetCustomer' API with appropriate $include parameters.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param model [CustomerModel[]] The list of customer objects to be created
      # @return [CustomerModel[]]
      def create_customers(companyId, model)
        path = "/api/v2/companies/#{companyId}/customers"
        post(path, model)
      end


      # Delete a customer record
      #
      # Deletes the customer object referenced by this URL.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @return [ErrorDetail[]]
      def delete_customer(companyId, customerCode)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}"
        delete(path)
      end


      # Retrieve a single customer
      #
      # Retrieve the customer identified by this URL.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this customer object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * Certificates - Fetch a list of certificates linked to this customer.
      # * CustomFields - Fetch a list of custom fields associated to this customer.
      # * attributes - Retrieves all attributes applied to the customer.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param include [String] Specify optional additional objects to include in this fetch request
      # @return [Object]
      def get_customer(companyId, customerCode, options={})
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}"
        get(path, options)
      end


      # Link attributes to a customer
      #
      # Link one or many attributes to a customer.
      #
      # A customer may have multiple attributes that control its behavior. You may link or unlink attributes to a
      # customer at any time. The full list of defined attributes may be found using `QueryCompanyCustomerAttributes` API.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this customer object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded the provided customer
      # @param customerCode [String] The unique code representing the current customer
      # @param model [CustomerAttributeModel[]] The list of attributes to link to the customer.
      # @return [FetchResult]
      def link_attributes_to_customer(companyId, customerCode, model)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/attributes/link"
        put(path, model)
      end


      # Link certificates to a customer
      #
      # Link one or more certificates to a customer.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param model [Object] The list of certificates to link to this customer
      # @return [FetchResult]
      def link_certificates_to_customer(companyId, customerCode, model)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/certificates/link"
        post(path, model)
      end


      # Link two customer records together
      #
      # Links a Ship-To customer record with a Bill-To customer record.
      #
      # Customer records represent businesses or individuals who can provide exemption certificates. Some customers
      # may have certificates that are linked to their shipping address or their billing address. To group these
      # customer records together, you may link multiple bill-to and ship-to addresses together to represent a single
      # entity that has multiple different addresses of different kinds.
      #
      # In general, a customer will have only one primary billing address and multiple ship-to addresses, representing
      # all of the different locations where they receive goods. To facilitate this type of customer, you can send in
      # one bill-to customer code and multiple ship-to customer codes in a single API call.
      #
      # Note that you can only link a ship-to customer record to a bill-to customer record. You may not link two customers
      # of the same kind together.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company defining customers.
      # @param code [String] The code of the bill-to customer to link.
      # @param model [Object] A list of information about ship-to customers to link to this bill-to customer.
      # @return [Object]
      def link_ship_to_customers_to_bill_customer(companyId, code, model)
        path = "/api/v2/companies/#{companyId}/customers/billto/#{code}/shipto/link"
        post(path, model)
      end


      # Retrieve a customer's attributes
      #
      # Retrieve the attributes linked to the customer identified by this URL.
      #
      # A customer may have multiple attributes that control its behavior. You may link or unlink attributes to a
      # customer at any time. The full list of defined attributes may be found using `QueryCompanyCustomerAttributes` API.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this customer object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded the provided customer
      # @param customerCode [String] The unique code representing the current customer
      # @return [FetchResult]
      def list_attributes_for_customer(companyId, customerCode)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/attributes"
        get(path)
      end


      # List certificates linked to a customer
      #
      # List all certificates linked to a customer.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param include [String] OPTIONAL: A comma separated list of special fetch options. You can specify one or more of the following:      * customers - Retrieves the list of customers linked to the certificate.   * po_numbers - Retrieves all PO numbers tied to the certificate.   * attributes - Retrieves all attributes applied to the certificate.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* exemptionNumber, status, ecmsId, ecmsStatus, pdf, pages
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def list_certificates_for_customer(companyId, customerCode, options={})
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/certificates"
        get(path, options)
      end


      # List valid certificates for a location
      #
      # List valid certificates linked to a customer in a particular country and region.
      #
      # This API is intended to help identify whether a customer has already provided a certificate that
      # applies to a particular country and region. This API is intended to help you remind a customer
      # when they have or have not provided copies of their exemption certificates to you during the sales
      # order process.
      #
      # If a customer does not have a certificate on file and they wish to provide one, you should send the customer
      # a CertExpress invitation link so that the customer can upload proof of their exemption certificate. Please
      # see the `CreateCertExpressInvitation` API to create an invitation link for this customer.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param country [String] Search for certificates matching this country. Uses the ISO 3166 two character country code.
      # @param region [String] Search for certificates matching this region. Uses the ISO 3166 two or three character state, region, or province code.
      # @return [Object]
      def list_valid_certificates_for_customer(companyId, customerCode, country, region)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/certificates/#{country}/#{region}"
        get(path)
      end


      # List all customers for this company
      #
      # List all customers recorded by this company matching the specified criteria.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # You can use the `$include` parameter to fetch the following additional objects for expansion:
      #
      # * Certificates - Fetch a list of certificates linked to this customer.
      # * attributes - Retrieves all attributes applied to the customer.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param include [String] OPTIONAL - You can specify the value `certificates` to fetch information about certificates linked to the customer.
      # @param filter [String] A filter statement to identify specific records to retrieve. For more information on filtering, see [Filtering in REST](http://developer.avalara.com/avatax/filtering-in-rest/).<br />*Not filterable:* shipTos
      # @param top [Integer] If nonzero, return no more than this number of results. Used with `$skip` to provide pagination for large datasets. Unless otherwise specified, the maximum number of records that can be returned from an API call is 1,000 records.
      # @param skip [Integer] If nonzero, skip this number of results before returning data. Used with `$top` to provide pagination for large datasets.
      # @param orderBy [String] A comma separated list of sort statements in the format `(fieldname) [ASC|DESC]`, for example `id ASC`.
      # @return [FetchResult]
      def query_customers(companyId, options={})
        path = "/api/v2/companies/#{companyId}/customers"
        get(path, options)
      end


      # Unlink attributes from a customer
      #
      # Unlink one or many attributes from a customer.
      #
      # A customer may have multiple attributes that control its behavior. You may link or unlink attributes to a
      # customer at any time. The full list of defined attributes may be found using `QueryCompanyCustomerAttributes` API.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this customer object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded the customer
      # @param customerCode [String] The unique code representing the current customer
      # @param model [CustomerAttributeModel[]] The list of attributes to unlink from the customer.
      # @return [FetchResult]
      def unlink_attributes_from_customer(companyId, customerCode, model)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/attributes/unlink"
        put(path, model)
      end


      # Unlink certificates from a customer
      #
      # Remove one or more certificates to a customer.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin, TechnicalSupportUser.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param model [Object] The list of certificates to link to this customer
      # @return [FetchResult]
      def unlink_certificates_from_customer(companyId, customerCode, model)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}/certificates/unlink"
        post(path, model)
      end


      # Update a single customer
      #
      # Replace the customer object at this URL with a new record.
      #
      # A customer object defines information about a person or business that purchases products from your
      # company. When you create a tax transaction in AvaTax, you can use the `customerCode` from this
      # record in your `CreateTransaction` API call. AvaTax will search for this `customerCode` value and
      # identify any certificates linked to this `customer` object. If any certificate applies to the transaction,
      # AvaTax will record the appropriate elements of the transaction as exempt and link it to the `certificate`.
      #
      # Using exemption certificates endpoints requires setup of an auditable document storage for each company that will use certificates.
      # Companies that do not have this storage system set up will receive the error `CertCaptureNotConfiguredError` when they call exemption
      # certificate related APIs. To check if this company is set up, call `GetCertificateSetup`. To request setup of the auditable document
      # storage for this company, call `RequestCertificateSetup`.
      #
      # ### Security Policies
      #
      # * This API requires one of the following user roles: AccountAdmin, AccountOperator, AccountUser, CompanyAdmin, CompanyUser, CSPTester, SSTAdmin, TechnicalSupportAdmin.
      # * This API depends on the following active services<br />*Required* (all): AvaTaxPro.
      # @param companyId [Integer] The unique ID number of the company that recorded this customer
      # @param customerCode [String] The unique code representing this customer
      # @param model [Object] The new customer model that will replace the existing record at this URL
      # @return [Object]
      def update_customer(companyId, customerCode, model)
        path = "/api/v2/companies/#{companyId}/customers/#{customerCode}"
        put(path, model)
      end

    end
  end
end