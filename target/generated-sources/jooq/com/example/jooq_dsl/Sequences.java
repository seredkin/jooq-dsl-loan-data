/*
 * This file is generated by jOOQ.
*/
package com.example.jooq_dsl;


import javax.annotation.Generated;

import org.jooq.Sequence;
import org.jooq.impl.SequenceImpl;


/**
 * Convenience access to all sequences in PUBLIC
 */
@Generated(
    value = {
        "http://www.jooq.org",
        "jOOQ version:3.10.1"
    },
    comments = "This class is generated by jOOQ"
)
@SuppressWarnings({ "all", "unchecked", "rawtypes" })
public class Sequences {

    /**
     * The sequence <code>PUBLIC.S_LOAN_DATA</code>
     */
    public static final Sequence<Long> S_LOAN_DATA = new SequenceImpl<Long>("S_LOAN_DATA", Public.PUBLIC, org.jooq.impl.SQLDataType.BIGINT);
}